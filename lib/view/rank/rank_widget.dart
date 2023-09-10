import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../model/rank/rank.dart';
import '../../model/rank/rank_model.dart';
import '../bar.dart';

part 'rank_view.dart';

class RankWidget extends ConsumerWidget {
  const RankWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rankModelProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: 25,
        ),
      );
    }
    final rank = state.rank!;
    return Card(
      elevation: 0,
      child: Row(
        children: [
          _RankIcon(rank: rank),
          const Gap(3),
          _RankStatus(rank: rank),
        ],
      ),
    );
  }
}

///ランクスコア
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

class _Title extends ConsumerWidget {
  const _Title(
      {required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.only(
        left: context.width * 0.02,
        top: context.width * 0.015,
        right: context.width * 0.02,
        bottom: 0.00,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: context.mainColor, width: context.width * 0.003),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: context.mainColor,
            size: context.height * 0.04,
          ),
          Gap(context.width * 0.01),
          Text(
            title,
            style: TextStyle(
                fontSize: context.height * 0.024,
                color: context.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: context.height * 0.018,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

//　デイリーミッションCard

class _RankName extends ConsumerWidget {
  const _RankName({required this.rank});

  final Rank rank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextLevelUpScore =
        rank.levelUpScore - (rank.score % rank.levelUpScore);
    final defaultRanks = ref.watch(rankModelProvider.notifier).defaultRanks;
    final totalScore = rank.score + defaultRanks[rank.rankId].score;
    return Container(
      width: context.width * 0.5,
      height: context.height * 0.17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),

          ///称号名
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rank.rankName,
                style: TextStyle(
                    fontSize: context.height * 0.03,
                    color: context.mainColor,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),

          ///経験値
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "${totalScore}pt",
              style: TextStyle(
                  fontSize: context.height * 0.04,
                  color: context.mainColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Gap(context.height * 0.01),

          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "次のレベルまであと${nextLevelUpScore}pt",
              style: TextStyle(
                fontSize: context.width * 0.035,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
          ),
          Gap(context.height * 0.01),
        ],
      ),
    );
  }
}
