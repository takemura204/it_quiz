import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/admob/admob_controller.dart';

///バナー広告
class AdBanner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(adMobProvider).isLoading;
    final adMob = ref.read(adMobProvider.notifier);
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: context.width * 1.0,
          height: context.height * 0.05,
          color: Colors.grey.shade300,
        ),
      );
    } else {
      return Container(
        width: context.width * 1.0,
        height: context.height * 0.05,
        child: AdWidget(ad: adMob.bannerAd),
      );
    }
  }
}
