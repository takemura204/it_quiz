part of '../home_learn_screen.dart';

class _LapInfoBar extends ConsumerWidget {
  const _LapInfoBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lapIndex = ref.watch(homeLearnScreenProvider).lapIndex;

    return Card(
      elevation: 1,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            children: [
              const Divider(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                    child: AutoSizeText(
                      lapIndex.toString(),
                      style: context.texts.titleMedium,
                      minFontSize: 20,
                    ),
                  ),
                  const Text(
                    "周目",
                  ),
                ],
              ),
              const Row(
                children: [
                  VerticalDivider(),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Text("知らない", style: TextStyle(fontSize: 14)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: AutoSizeText(
                      ref
                          .watch(homeLearnScreenProvider)
                          .unKnowQuizItemList
                          .length
                          .toString(),
                      style: context.texts.titleMedium
                          ?.copyWith(color: context.incorrectColor),
                      minFontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const VerticalDivider(),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "知っている",
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: AutoSizeText(
                      ref
                          .watch(homeLearnScreenProvider)
                          .knowQuizItemList
                          .length
                          .toString(),
                      style: context.texts.titleMedium
                          ?.copyWith(color: context.correctColor),
                      minFontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
