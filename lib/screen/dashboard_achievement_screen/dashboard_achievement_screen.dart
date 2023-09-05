import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/bar.dart';

import '../../model/rank/rank.dart';
import '../../model/rank/rank_model.dart';

part 'dashboard_achievement_view.dart';

///　ランクスコア
class RankScore extends ConsumerWidget {
  const RankScore();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rankModelProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.22,
        ),
      );
    }
    final rank = state.rank!;

    return Container(
      height: context.height * 0.25,
      child: Card(
        elevation: 3,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ///タイトル
            const _Title(
              title: "スコア",
              subtitle: "",
              icon: Icons.emoji_events_outlined,
            ),
            const Spacer(),

            Row(
              children: [
                const Spacer(),

                ///レベル
                GestureDetector(
                  onTap: () {
                    ref.read(rankModelProvider.notifier).updateScore(10);
                  },
                  child: ProgressRangeChart(
                    width: context.height * 0.17,
                    size: context.height * 0.17,
                    maxScore: rank.levelUpScore,
                    currentScore: rank.score % rank.levelUpScore,
                    widget: Column(
                      children: [
                        const Spacer(),
                        Text(
                          "Lv.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.025,
                            color: context.mainColor,
                            height: 1.0,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          "${rank.level}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.05,
                            color: context.mainColor,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const Spacer(),

                /// 称号
                _RankName(rank: rank),
                const Spacer(),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class RankIcon extends ConsumerWidget {
  const RankIcon();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rankModelProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.22,
        ),
      );
    }
    final rank = state.rank!;

    return Container(
      height: context.height * 0.25,
      child: Card(
        elevation: 3,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              color: Colors.grey.shade300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Transform(
                          transform: Matrix4.identity()..scale(2.0, 0.6),
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.crown,
                            color: context.mainColor,
                            size: 10,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Container(
                        height: 30,
                        child: Text(
                          "${rank.level}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: context.mainColor,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Container(
                        height: 15,
                        child: Text(
                          "LEVEL",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: context.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// 称号
            _RankName(rank: rank),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
