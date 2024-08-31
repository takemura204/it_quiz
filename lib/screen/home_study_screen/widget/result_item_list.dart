part of '../home_study_screen.dart';

class _ResultItemList extends ConsumerWidget {
  const _ResultItemList({required this.quizItemList, required this.knowQuizItemList});

  final List<QuizItem> quizItemList;
  final List<QuizItem> knowQuizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyType = ref.watch(quizModelProvider).studyType;
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Container(
            width: context.width * 1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02, vertical: context.width * 0.02),
            child: Text(
              studyType == StudyType.learn ? '用語一覧' : 'クイズ一覧',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: quizItemList.length,
          itemBuilder: (BuildContext context, int index) {
            final quizItem = quizItemList[index];
            final isKnow = knowQuizItemList.any((knowItem) => knowItem.quizId == quizItem.quizId);
            return ResultItemCard(
                index: index,
                quizItem: quizItemList[index],
                studyType: StudyType.learn,
                isKnow: isKnow,
                onTapCheckButton: () {
                  ref.read(homeStudyScreenProvider.notifier).tapWeakButton(index);
                },
                onTapSaveButton: () {
                  ref.read(homeStudyScreenProvider.notifier).tapSavedButton(index);
                });
          },
        ),
      ],
    );
  }
}
