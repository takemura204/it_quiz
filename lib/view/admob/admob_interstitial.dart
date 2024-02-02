import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/admob/admob_controller.dart';

class AdInterstitial extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adMobController = ref.read(adMobProvider.notifier);

    return FutureBuilder<InterstitialAd?>(
      future: adMobController.createNewInterstitialAd(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          // 広告が正常にロードされたことを確認してから表示
          snapshot.data!.show();
          return Container(); // 広告の表示を試みたことを示すダミーのウィジェットを返す
        } else {
          // 広告がロード中の場合
          return Container(
              height: MediaQuery.of(context).size.height,
              color: context.backgroundColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 15),
                  Text(
                    '読み込み中...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ));
        }
      },
    );
  }
}
