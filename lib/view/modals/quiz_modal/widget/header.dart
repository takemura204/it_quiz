part of '../quiz_modal.dart';

class _Header extends ConsumerWidget {
  const _Header({required this.title, required this.quizItemList});

  final String title;
  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterQuizItemList = ref.watch(homeQuizModalProvider.select((s) => s.filterQuizItemList));
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
              if (quizItemList.length != filterQuizItemList.length) {
                ref.read(homeQuizModalProvider.notifier).resetFilterQuizList();
                Navigator.of(context).pop();
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
