import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:state_notifier/state_notifier.dart';

import 'admob_state.dart';

final adMobProvider = StateNotifierProvider<AdMobController, AdMobState>(
  (ref) => AdMobController(),
);

class AdMobController extends StateNotifier<AdMobState> with LocatorMixin {
  AdMobController() : super(const AdMobState()) {
    initState();
  }

  late BannerAd _bannerAd;
  late NativeAd _nativeAd;
  late InterstitialAd _interstitialAd;

  BannerAd get bannerAd => _bannerAd;

  NativeAd get nativeAd => _nativeAd;

  InterstitialAd get interstitialAd => _interstitialAd;

  @override
  Future initState() async {
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _nativeAd.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }

  // バナー広告を新しく生成するメソッド
  Future<BannerAd> createNewBannerAd() async {
    try {
      final newBannerAd = BannerAd(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/6300978111' // Androidのテスト広告ID
            : 'ca-app-pub-3940256099942544/2934735716', // iOSのテスト広告ID
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            print('Ad loaded: ${ad.adUnitId}.');
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            print('Ad failed to load: ${ad.adUnitId}, $error');
            ad.dispose();
          },
        ),
      );

      await newBannerAd.load();

      return newBannerAd;
    } catch (e, s) {
      print({"Error：createNewNativeAd", e, s});
      return bannerAd;
    }
  }

  Future<InterstitialAd?> createNewInterstitialAd() async {
    final completer = Completer<InterstitialAd?>();

    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          completer.complete(ad);
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent:
                (InterstitialAd ad, AdError error) {
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          completer.completeError(error);
        },
      ),
    );

    return completer.future;
  }

  ///インターステシャル広告表示
  Future showAdInterstitial() async {
    final adShowCount = state.adShowCount;
    if (adShowCount == 0) {
      state = state.copyWith(adShowCount: adShowCount + 1);
      final interstitialAd = await createNewInterstitialAd();
      if (interstitialAd != null) {
        interstitialAd.show();
      }
    } else if (adShowCount == 3) {
      state = state.copyWith(adShowCount: 0);
      final interstitialAd = await createNewInterstitialAd();
      if (interstitialAd != null) {
        interstitialAd.show();
      }
    } else {
      state = state.copyWith(adShowCount: adShowCount + 1);
    }
  }
}

///AdMobの公式テスト広告ユニットID
// Android:
// バナー: ca-app-pub-3940256099942544/6300978111
// インタースティシャル: ca-app-pub-3940256099942544/1033173712
// リワード: ca-app-pub-3940256099942544/5224354917
// ネイティブアドバンス:ca-app-pub-3940256099942544/2247696110
//
// iOS:
// バナー: ca-app-pub-3940256099942544/2934735716
// インタースティシャル: ca-app-pub-3940256099942544/4411468910
// リワード: ca-app-pub-3940256099942544/1712485313
// ネイティブアドバンス:ca-app-pub-3940256099942544/3986624511

///本番環境
// Android:
// バナー:ca-app-pub-5053471763020307~7242186229
// ネイティブアドバンス:ca-app-pub-5053471763020307~7242186229
//
//iOS:
// バナー:ca-app-pub-5053471763020307/3260224205
// ネイティブアドバンス；ca-app-pub-5053471763020307~1414649631
