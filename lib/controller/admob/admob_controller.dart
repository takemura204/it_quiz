import 'dart:async';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kentei_quiz/model/lang/secret_key.dart';
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
  late InterstitialAd _interstitialAd;

  BannerAd get bannerAd => _bannerAd;

  InterstitialAd get interstitialAd => _interstitialAd;

  @override
  Future initState() async {
    await initAppTrackingTransparency();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }

  Future initAppTrackingTransparency() async {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  // バナー広告を新しく生成するメソッド
  Future<BannerAd> createNewBannerAd(double height) async {
    try {
      AdSize adSize;
      if (height <= 50) {
        adSize = AdSize.fullBanner; // 61から90までならleaderboard
      } else if (height <= 60) {
        adSize = AdSize.fullBanner; // 高さ60までならfullBanner
      } else if (height <= 90) {
        adSize = AdSize.leaderboard; // 61から90までならleaderboard
      } else if (height <= 100) {
        adSize = AdSize.largeBanner; // 91から100までならlargeBanner
      } else if (height <= 250) {
        adSize = AdSize.mediumRectangle; // 101から250までならmediumRectangle
      } else {
        adSize = AdSize.leaderboard; // 251以上ならデフォルトでleaderboard
      }
      final newBannerAd = BannerAd(
        adUnitId: SecretKey().bannerAdUnitId,
        size: adSize,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            // print('Ad loaded: ${ad.adUnitId}.');
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
      adUnitId: SecretKey().interstitialAdUnitId,
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
