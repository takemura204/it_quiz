import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/admob/admob_controller.dart';
import '../../model/user/user.model.dart';

class AdNative extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adMobController = ref.read(adMobProvider.notifier);
    final isPremium = ref.watch(userModelProvider.select((s) => s.isPremium));

    return !isPremium
        ? FutureBuilder<BannerAd>(
            future: adMobController.createNewBannerAd(), // 新しいバナー広告を生成
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: context.width * 1.0,
                  height: 300,
                  child: AdWidget(ad: snapshot.data!),
                );
              } else {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: context.width * 1.0,
                    height: 300,
                    color: Colors.grey.shade300,
                  ),
                );
              }
            },
          )
        : Container();
  }
}
