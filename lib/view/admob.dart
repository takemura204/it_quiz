import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../controller/admob/admob_controller.dart';

///バナー広告
class AdBanner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adLoaded = ref.watch(adMobProvider);
    final adMob = ref.read(adMobProvider.notifier);
    if (adLoaded) {
      return Container(
        width: context.width * 1.0,
        height: context.width * 0.07,
        child: AdWidget(ad: adMob.bannerAd),
      );
    } else {
      return Container(
        height: context.height * 0.07,
        color: Colors.cyan,
        child: Row(
          children: const [
            Spacer(),
            Text(
              "広告がない",
              style: TextStyle(fontSize: 30),
            ),
            Spacer(),
          ],
        ),
      );
    }
  }
}
