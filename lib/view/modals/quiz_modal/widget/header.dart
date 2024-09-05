part of '../quiz_modal.dart';

class _Header extends ConsumerWidget {
  const _Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    final filterQuizList = ref.watch(homeQuizModalProvider.select((s) => s.filterQuizList));
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    final isFiltered = quizItemList.length != filterQuizItemList.length;
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(40),
          Expanded(
            child: Container(
              height: 32,
              alignment: Alignment.center,
              child: Text(
                title,
                style: context.texts.titleMedium,
              ),
            ),
          ),
          ClearButton(
            iconSize: 30,
            onPressed: () async {
              if (isFiltered) {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return PrimaryDialog(
                        onPressed: () {
                          ref.read(homeQuizModalProvider.notifier).resetFilterQuizList();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        title: "学習を中断しますか？",
                        subWidget: Text(
                          "学習を中断すると\nこれまでの内容は保存されません。",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: context.width * 0.04, color: Colors.black87),
                          maxLines: 2,
                        ),
                        cancelText: "続ける",
                        doneText: "中断する",
                      );
                    });
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          const Gap(10),
        ],
      ),
    );
  }
}

class _FilterList extends HookConsumerWidget {
  const _FilterList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ['ああああああああ', 'いいいいいい', 'ううううううううううううう'];
    return Container(
      width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children: [
          ...filterList.map((stockTheme) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  stockTheme,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
