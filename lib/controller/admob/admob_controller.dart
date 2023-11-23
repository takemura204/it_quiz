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

  BannerAd get bannerAd => _bannerAd;

  NativeAd get nativeAd => _nativeAd;

  @override
  Future initState() async {
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _nativeAd.dispose();
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
