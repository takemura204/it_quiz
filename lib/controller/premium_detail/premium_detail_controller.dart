import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/premium_detail/premium_detail_state.dart';
import 'package:kentei_quiz/model/lang/secret_key.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final premiumDetailProvider =
    StateNotifierProvider<PremiumDetailController, PremiumDetailState>(
  (ref) => PremiumDetailController(ref: ref),
);

class PremiumDetailController extends StateNotifier<PremiumDetailState> {
  PremiumDetailController({required this.ref})
      : super(const PremiumDetailState()) {
    initState();
  }

  final Ref ref;

  // 定義された製品ID
  static const String _kProductId = 'purchase_980';
  late Offerings offerings;
  bool isSubscribed = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void initState() {
    initInAppPurchase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initInAppPurchase() async {
    try {
      //consoleにdebug情報を出力する
      await Purchases.setDebugLogsEnabled(true);
      late PurchasesConfiguration configuration;

      if (Platform.isAndroid) {
        configuration =
            PurchasesConfiguration(SecretKey().androidRevenueCatAPIKey);
      } else if (Platform.isIOS) {
        configuration = PurchasesConfiguration(SecretKey().iosRevenueCatAPIKey);
      }
      await Purchases.configure(configuration);
      //offeringsを取ってくる
      offerings = await Purchases.getOfferings();
      //firebaseのidと、revenuecatのuserIdを一緒にしている場合、firebaseAuthのuidでログイン
      final result = await Purchases.logIn(auth.currentUser!.uid);

      await getPurchaserInfo(result.customerInfo);

      //今アクティブになっているアイテムは以下のように取得可能
      print("アクティブなアイテム ${result.customerInfo.entitlements.active.keys}");
    } catch (e) {
      print("initInAppPurchase error caught! ${e.toString()}");
    }
  }

  Future<void> getPurchaserInfo(CustomerInfo customerInfo) async {
    try {
      isSubscribed = await updatePurchases(customerInfo, _kProductId);
    } on PlatformException catch (e) {
      print(" getPurchaserInfo error ${e.toString()}");
    }
  }

  Future<bool> updatePurchases(
      CustomerInfo purchaserInfo, String entitlement) async {
    var isPurchased = false;
    final entitlements = purchaserInfo.entitlements.all;
    if (entitlements.isEmpty) {
      isPurchased = false;
    }
    if (!entitlements.containsKey(entitlement)) {
      ///そもそもentitlementが設定されて無い場合
      isPurchased = false;
    } else if (entitlements[entitlement]!.isActive) {
      ///設定されていて、activeになっている場合
      isPurchased = true;
    } else {
      isPurchased = false;
    }
    return isPurchased;
  }

  Future<void> makePurchase(String offeringsName) async {
    try {
      Package? package;
      package = offerings.all[offeringsName]
          ?.monthly; //offeringsは適宜ご自身の設定したofferingsの名前に変えてください
      if (package != null) {
        await Purchases.logIn(auth.currentUser!.uid);
        final CustomerInfo customerInfo =
            await Purchases.purchasePackage(package);
        await getPurchaserInfo(customerInfo);
      }
    } on PlatformException catch (e) {
      print(" makePurchase error ${e.toString()}");
    }
  }

//  購入の復元
  Future<void> restorePurchase(String entitlement) async {
    try {
      final CustomerInfo customerInfo = await Purchases.restorePurchases();
      final isActive = await updatePurchases(customerInfo, entitlement);
      if (!isActive) {
        print("購入情報なし");
      } else {
        await getPurchaserInfo(customerInfo);
        print("${entitlement} 購入情報あり　復元する");
      }
    } on PlatformException catch (e) {
      print("purchase repo  restorePurchase error ${e.toString()}");
    }
  }

  ///ローディング表示
  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
