import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/premium_detail/premium_detail_state.dart';
import 'package:kentei_quiz/model/lang/secret_key.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
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

  FirebaseAuth auth = FirebaseAuth.instance;
  final productId = SecretKey().kProductId;

  void initState() {
    initInAppPurchase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initInAppPurchase() async {
    try {
      print('initInAppPurchase');
      //consoleにdebug情報を出力する
      await Purchases.setLogLevel(LogLevel.debug);
      PurchasesConfiguration configuration;

      if (Platform.isAndroid) {
        configuration =
            PurchasesConfiguration(SecretKey().androidRevenueCatAPIKey);
        await Purchases.configure(configuration);
      } else if (Platform.isIOS) {
        configuration = PurchasesConfiguration(SecretKey().iosRevenueCatAPIKey);
        await Purchases.configure(configuration);
      }

      ///offeringsを取ってくる
      final offerings = await Purchases.getOfferings();
      print("offerings: $offerings");

      ///firebaseのidと、revenuecatのuserIdを一緒にしている場合、firebaseAuthのuidでログイン
      final result = await Purchases.logIn(auth.currentUser!.uid);
      final customerInfo = result.customerInfo;
      print("result.customerInfo: ${result.customerInfo}");
      await updateIsSubscribed(customerInfo);
    } catch (e) {
      print("Error initInAppPurchase :${e.toString()}");
    }
  }

  Future<void> updateIsSubscribed(CustomerInfo customerInfo) async {
    try {
      bool isSubscribed = false;
      final entitlements = customerInfo.entitlements.all;

      if (!entitlements.isNotEmpty) {
        print('entitlements.isEmpty');
      }
      if (!entitlements.containsKey(productId)) {
        print('entitlements.containsKey(productId)');
      }
      if (!entitlements[productId]!.isActive) {
        print('entitlements[productId]!.isActive');
      }

      if (entitlements.isNotEmpty &&
          entitlements.containsKey(productId) &&
          entitlements[productId]!.isActive) {
        isSubscribed = true;
      } else {
        print('購入されていないよ！！');
      }

      state = state.copyWith(isSubscribed: isSubscribed);
      ref.read(authModelProvider.notifier).updateIsPremium(isSubscribed);
    } on PlatformException catch (e) {
      print("Error checking subscription status: ${e.toString()}");
    }
  }

  ///プレミアム特典購入
  Future buyPurchase980() async {
    try {
      print('購入プロセスを開始');
      setIsLoading(true);

      final offerings = await Purchases.getOfferings();
      print({'offerings', offerings});
      if (offerings.current != null) {
        final package = offerings.all['$productId']?.lifetime;
        print({'package', package});
        if (package != null) {
          final packageInfo = await Purchases.purchasePackage(package);
          print(packageInfo);
          updateIsSubscribed(packageInfo);
          setIsShowPurchasedModal(true);
          print('購入完了!');
        } else {
          print('有効ながpackage見つかりません。');
        }
      } else {
        print('有効なofferingsが見つかりません。');
      }
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      print(errorCode);
      switch (errorCode) {
        case PurchasesErrorCode.purchaseCancelledError:
          print('User canceled');
          break;
        case PurchasesErrorCode.purchaseNotAllowedError:
          print('Purchases not allowed on this device.');
          break;
        case PurchasesErrorCode.purchaseInvalidError:
          print('Purchase invalid, check payment source.');
          break;
        default:
          print('unKnown Error');
          break;
      }

      //ユーザーが購入キャンセルしたとき
      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        print('User Cancelled');
      }
      //購入が許可されなかったとき
      else if (errorCode == PurchasesErrorCode.purchaseNotAllowedError) {
        print("Purchase not allowed Error");
      }
    } finally {
      setIsLoading(false);
    }
  }

//  購入の復元
  Future<void> restorePurchase(String entitlement) async {
    try {
      final customerInfo = await Purchases.restorePurchases();
      await updateIsSubscribed(customerInfo);
    } on PlatformException catch (e) {
      print("purchase repo  restorePurchase error ${e.toString()}");
    }
  }

  ///ローディング表示
  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  ///ローディング表示
  void setIsShowPurchasedModal(bool value) {
    state = state.copyWith(isShowPurchasedModal: value);
  }
}
