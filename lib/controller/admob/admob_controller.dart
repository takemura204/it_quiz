import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final adMobProvider =
    StateNotifierProvider<AdMobController, bool>((ref) => AdMobController());

class AdMobController extends StateNotifier<bool> {
  AdMobController() : super(false) {
    initialize();
  }

  late BannerAd _bannerAd;
  bool _isInitialized = false;

  BannerAd get bannerAd {
    assert(_isInitialized, 'AdMobController is not initialized.');
    return _bannerAd;
  }

  Future<void> initialize() async {
    await MobileAds.instance.initialize();

    _bannerAd = BannerAd(
      ///本番用
      // adUnitId: Platform.isAndroid
      //     ? 'ca-app-pub-5053471763020307/2204949130'//Android
      //     : 'ca-app-pub-5053471763020307/7628666206',//iOS
      ///テスト用
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111' //Android
          : 'ca-app-pub-3940256099942544/2934735716', //iOS
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('Ad loaded: ${ad.adUnitId}.');
          state = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to load: ${ad.adUnitId}, $error');
          ad.dispose();
        },
      ),
    );

    await _bannerAd.load();
    _isInitialized = true;
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }
}
//以下は、AdMobの公式テスト広告ユニットIDです。
// Android:
// バナー: ca-app-pub-3940256099942544/6300978111
// インタースティシャル: ca-app-pub-3940256099942544/1033173712
// リワード: ca-app-pub-3940256099942544/5224354917
//
// iOS:
// バナー: ca-app-pub-3940256099942544/2934735716
// インタースティシャル: ca-app-pub-3940256099942544/4411468910
// リワード: ca-app-pub-3940256099942544/1712485313
