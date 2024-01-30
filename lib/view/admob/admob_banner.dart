import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/admob/admob_controller.dart';

///バナー広告
class AdBanner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adMobController = ref.read(adMobProvider.notifier);

    // 広告がロードされたら新しいバナー広告を作成して表示する
    return FutureBuilder<BannerAd>(
      future: adMobController.createNewBannerAd(), // 新しいバナー広告を生成
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: context.width * 1.0,
            color: context.backgroundColor,
            height: 50,
            child: AdWidget(ad: snapshot.data!),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: context.width * 1.0,
              height: 50,
              color: Colors.grey.shade300,
            ),
          );
        }
      },
    );
  }
}
