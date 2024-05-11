import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/admob/admob_controller.dart';
import '../../model/user/auth_model.dart';

///バナー広告
class AdBanner extends ConsumerWidget {
  const AdBanner({this.height = 60.0});

  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium));
    return !isPremium
        ? FutureBuilder<BannerAd?>(
            future: ref.read(adMobProvider.notifier).createNewBannerAd(height),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  !snapshot.hasError) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: height,
                  alignment: Alignment.center,
                  child: AdWidget(ad: snapshot.data!),
                );
              } else {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    color: Colors.grey.shade300,
                  ),
                );
              }
            },
          )
        : Container(); // プレミアムユーザーは広告を表示しない
  }
}
