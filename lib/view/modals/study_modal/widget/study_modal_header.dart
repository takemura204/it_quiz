part of '../study_modal.dart';

class _Header extends ConsumerWidget {
  const _Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    final filterQuizList = ref.watch(homeStudyModalProvider.select((s) => s.filterQuizList));
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
            onPressed: () {
              if (isFiltered) {
                ref.read(homeStudyModalProvider.notifier).setIsShowCancelModal(true);
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
