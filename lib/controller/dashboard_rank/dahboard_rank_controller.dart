import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../resource/dashboard/rank_data.dart';
import 'dashboard_rank_state.dart';

final dashboardRankProvider =
    StateNotifierProvider<DashboardRankController, DashboardRankState>(
  (ref) => DashboardRankController(ref: ref),
);

class DashboardRankController extends StateNotifier<DashboardRankState>
    with LocatorMixin {
  DashboardRankController({required this.ref}) : super(DashboardRankState()) {
    initState();
  }

  final Ref ref;

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _resetData();
    state = state.copyWith(isLoading: true);
    _loadDashboardRankData().then((_) {
      state = state.copyWith(isLoading: false);
    });
    super.initState();
  }

  ///データ読み込み
  Future _loadDashboardRankData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final rankDataJson = prefs.getString('rankData');
      //端末保存されている時
      if (rankDataJson != null && rankDataJson.isNotEmpty) {
        final user = _auth.currentUser;
        final uid = user?.uid;
        final rankData = RankData.fromJson(json.decode(rankDataJson));
        print(rankData);
        //アカウント登録している時
        if (uid != null) {
          final docSnap = await _firestore.collection('score').doc(uid).get();
          if (docSnap.exists) {
            final data = docSnap.data();
            //Firestoreから参照
            state = state.copyWith(
              rankData: rankData.copyWith(
                rankId: data?['rankId'],
                rankName: data?['rankName'],
                rankScore: data?['rankScore'],
                level: data?['level'],
                levelScore: data?['levelScore'],
              ),
            );
          } else {
            state = state.copyWith(rankData: rankData);
          }
          print(state.rankData);
        }
        //ゲストユーザーの場合
        else {
          state = state.copyWith(rankData: rankData);
        }
        print("loadDashboardRankData1");
      }
      //初回起動時
      else {
        print("loadDashboardRankData2");
        state = state.copyWith(rankData: initRankDataList[0]);
      }
      await _saveDevice(); //端末保存
      await _saveFirestore();
    } catch (e, s) {
      print("Error：loadDashboardRankData");
      print({e, s});
    }
  }

  /// Firestoreに保存
  Future _saveFirestore() async {
    try {
      final user = _auth.currentUser;
      final uid = user?.uid;
      final users = FirebaseFirestore.instance.collection('scores');
      final docRef = users.doc(uid);
      final docSnap = await docRef.get();
      if (!docSnap.exists) {
        final rankData = state.rankData;
        await docRef.set({
          'uid': uid,
          'rankId': rankData?.rankId,
          'rankName': rankData?.rankId,
          'rankScore': rankData?.rankScore,
          'level': rankData?.level,
          'levelScore': rankData?.levelScore,
          'updateAt': DateTime.now(),
        }, SetOptions(merge: true));
        print("Firestore Save SignUp");
      }
      return state;
    } catch (e, s) {
      print("saveFirestore　Error");
      print({e, s});
    }
    return state;
  }

  /// 端末に保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('rankData', json.encode(state.rankData!.toJson()));
  }

  /// 現在のstateをリセット
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("rankData");
  }

  ///称号一覧
  final initRankDataList = [
    const RankData(
        rankId: 0, rankName: "未挑戦者", rankScore: 0, levelScore: 1, level: 1),
    const RankData(
        rankId: 1,
        rankName: "ビギナーランク",
        rankScore: 250,
        levelScore: 25,
        level: 10), // ビギナーランク(30×10)
    const RankData(
        rankId: 2,
        rankName: "ルーキーランク",
        rankScore: 500,
        levelScore: 50,
        level: 20), // ルーキーランク(50×10)
    const RankData(
        rankId: 3,
        rankName: "ブロンズランク",
        rankScore: 1250,
        levelScore: 75,
        level: 30), // ブロンズランク(80×10)
    const RankData(
        rankId: 4,
        rankName: "シルバーランク",
        rankScore: 2250,
        levelScore: 100,
        level: 40), // シルバーランク(100×10)
    const RankData(
        rankId: 5,
        rankName: "ゴールドランク",
        rankScore: 3500,
        levelScore: 125,
        level: 50), // ゴールドランク(130×10)
    const RankData(
      rankId: 6,
      rankName: "プラチナランク",
      rankScore: 5000,
      levelScore: 150,
      level: 60,
    ), // プラチナランク(150×10)
    const RankData(
        rankId: 7,
        rankName: "チャンピオンランク",
        rankScore: 6750,
        levelScore: 175,
        level: 70), // チャンピオンランク(180×10)
    const RankData(
        rankId: 8,
        rankName: "マスターランク",
        rankScore: 8750,
        levelScore: 200,
        level: 80), // マスターランク(200×10)
    const RankData(
        rankId: 9,
        rankName: "レジェンドランク",
        rankScore: 11000,
        levelScore: 225,
        level: 90), // レジェンドランク(250×10)
    const RankData(
      rankId: 10,
      rankName: "レジェンドランク",
      rankScore: 13500,
      levelScore: 250,
      level: 100,
    ) // レジェンドランク(330×10)
  ];
}
