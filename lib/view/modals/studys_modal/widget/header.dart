part of '../search_modal.dart';

class _Header extends ConsumerWidget {
  const _Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuizItemList =
        ref.watch(homeSearchScreenProvider.select((s) => s.searchQuizItemList));
    final filterQuizList = ref.watch(homeSearchModalProvider.select((s) => s.filterQuizList));
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    final isFiltered = searchQuizItemList.length != filterQuizItemList.length;
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
                style: context.texts.titleSmall,
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
                          ref.read(homeSearchModalProvider.notifier).resetFilterQuizList();
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
