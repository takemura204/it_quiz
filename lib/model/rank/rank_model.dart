import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/rank/rank.dart';
import 'package:kentei_quiz/model/rank/ranks.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rank_resorce.dart';

final rankModelProvider =
    StateNotifierProvider<RankModel, Ranks>((ref) => RankModel(ref));

class RankModel extends StateNotifier<Ranks> {
  RankModel(this.ref) : super(Ranks()) {
    () async {
      await initState();
    }();
  }

  final Ref ref;
  final _auth = FirebaseAuth.instance;

  DocumentReference<Rank> get _rankRef => FirebaseFirestore.instance
      .collection('score')
      .doc(_auth.currentUser?.uid)
      .withConverter(
        fromFirestore: (snapshot, _) => Rank.fromDocumentSnapshot(snapshot),
        toFirestore: (Rank rank, _) => rank.toJsonWithoutUnnecessaryFields(),
      );

  Future initState() async {
    // _resetData();
    state = state.copyWith(isLoading: true);
    _loadRank().then((_) {
      state = state.copyWith(isLoading: false);
    });
  }

  ///読み込み
  Future _loadRank() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final rankDataJson = prefs.getString('rankData');

      //端末保存されている時
      if (rankDataJson != null && rankDataJson.isNotEmpty) {
        final user = _auth.currentUser;
        final uid = user?.uid;
        final rankData = Rank.fromJson(json.decode(rankDataJson));
        //アカウント登録している時
        if (uid != null) {
          final docSnap = await _rankRef.get();
          final getRankData = docSnap.data();
          //データが存在する場合
          if (getRankData != null) {
            final matchRank = defaultRanks.firstWhere(
                (defaultRank) => defaultRank.rankId == getRankData.rankId,
                orElse: () => defaultRanks[0]);

            final rankState = matchRank.copyWith(
              rankId: getRankData.rankId,
              score: getRankData.score,
              level: getRankData.level,
              rankName: matchRank.rankName,
              levelUpScore: matchRank.levelUpScore,
              uid: uid,
              updateAt: DateTime.now(),
            );
            state = state.copyWith(rank: rankState);
            print("Succces rankData");
          }
          //データが存在しない場合
          else {
            state = state.copyWith(
                rank: rankData.copyWith(uid: uid, updateAt: DateTime.now()));
          }
        }
        //ゲストユーザーの場合
        else {
          state = state.copyWith(rank: rankData);
        }
      }
      //端末保存されていない時(初回起動時)
      else {
        state = state.copyWith(rank: defaultRanks[0]);
      }
      await _saveFirestore();
      await _saveDevice();
    } catch (e, s) {
      print({"Error：_loadRank", e, s});
    }
  }

  ///更新
  Future updateScore(int addScore) async {
    try {
      final rank = state.rank;

      final updateScore = rank!.score + addScore;
      final nextLevelScore = rank.levelUpScore *
          ((rank.level + 1) - defaultRanks[rank.rankId].level);
      final totalScore = updateScore + defaultRanks[rank.rankId].score;

      // レベルアップ && ランクアップ
      if (totalScore >= defaultRanks[rank.rankId + 1].score &&
          rank.level >= defaultRanks[rank.rankId + 1].level - 1) {
        final differenceScore =
            totalScore - defaultRanks[rank.rankId + 1].score;

        state = state.copyWith(
            rank: rank.copyWith(
          rankId: defaultRanks[rank.rankId + 1].rankId,
          rankName: defaultRanks[rank.rankId + 1].rankName,
          level: rank.level + 1,
          levelUpScore: defaultRanks[rank.rankId + 1].levelUpScore,
          score: differenceScore,
        ));
      }
      // レベルアップ
      else if (updateScore >= nextLevelScore &&
          rank.level < defaultRanks[rank.rankId + 1].level - 1) {
        state = state.copyWith(
            rank: rank.copyWith(
          rankId: rank.rankId,
          level: rank.level + 1,
          rankName: rank.rankName,
          levelUpScore: rank.levelUpScore,
          score: updateScore,
        ));
      }
      //ポイント加算
      else {
        state = state.copyWith(
            rank: rank.copyWith(
          rankId: rank.rankId,
          rankName: rank.rankName,
          level: rank.level,
          levelUpScore: rank.levelUpScore,
          score: updateScore,
        ));
      }
      await _saveFirestore();
      await _saveDevice();
    } catch (e, s) {
      print({e, s});
      print("Error：_updateScore");
    }
  }

  /// Firestoreに保存
  Future _saveFirestore() async {
    try {
      final docRef = _rankRef;
      final rankData = state.rank;
      await docRef.set(rankData!, SetOptions(merge: true));
      return state;
    } catch (e, s) {
      print("saveFirestore　Error");
      print({e, s});
    }
  }

  /// 端末に保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('rankData', json.encode(state.rank!.toJson()));
  }

  /// 現在のstateをリセット
  Future resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("rankData");
  }
}
