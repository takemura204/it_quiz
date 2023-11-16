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
    initBannerData();
  }

  late BannerAd _bannerAd;

  BannerAd get bannerAd => _bannerAd;

  Future<void> initBannerData() async {
    state = state.copyWith(isLoading: true);
    await MobileAds.instance.initialize();
    _bannerAd = BannerAd(
      ///本番用
      // adUnitId: Platform.isAndroid
      //     ? 'ca-app-pub-5053471763020307~7242186229'//Android
      //     : 'ca-app-pub-5053471763020307/3260224205',//iOS
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111' //Android
          : 'ca-app-pub-3940256099942544/2934735716', //iOS
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('Ad loaded: ${ad.adUnitId}.');
          state = state.copyWith(isLoading: false);
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to load: ${ad.adUnitId}, $error');
          ad.dispose();
          state = state.copyWith(isLoading: false);
        },
      ),
    );

    await _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }
}

///以下は、AdMobの公式テスト広告ユニットID
// Android:
// バナー: ca-app-pub-3940256099942544/6300978111
// インタースティシャル: ca-app-pub-3940256099942544/1033173712
// リワード: ca-app-pub-3940256099942544/5224354917
//
// iOS:
// バナー: ca-app-pub-3940256099942544/2934735716
// インタースティシャル: ca-app-pub-3940256099942544/4411468910
// リワード: ca-app-pub-3940256099942544/1712485313
