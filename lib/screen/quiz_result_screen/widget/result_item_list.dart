part of '../quiz_result_screen.dart';

class _ResultItemList extends ConsumerWidget {
  const _ResultItemList({required this.quizItemList});

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyType = ref.watch(quizModelProvider.select((s) => s.studyType));

    void onTapCheckButton(StudyType studyType, int index) {
      switch (studyType) {
        case StudyType.study:
          return ref.read(homeStudyScreenProvider.notifier).tapWeakButton(index);
        case StudyType.learn:
          return ref.read(quizLearnScreenProvider.notifier).tapWeakButton(index);
        case StudyType.choice:
          return ref.read(quizChoiceScreenProvider.notifier).tapWeakButton(index);
        default:
          return;
      }
    }

    void tapSavedButton(StudyType studyType, int index) {
      switch (studyType) {
        case StudyType.study:
          return ref.read(homeStudyScreenProvider.notifier).tapSavedButton(index);
        case StudyType.learn:
          return ref.read(quizLearnScreenProvider.notifier).tapSavedButton(index);
        case StudyType.choice:
          return ref.read(quizChoiceScreenProvider.notifier).tapSavedButton(index);
        default:
          return;
      }
    }

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
            return ResultItemCard(
                index: index,
                quizItem: quizItemList[index],
                studyType: StudyType.learn,
                isKnow: quizItem.isKnow,
                onTapCheckButton: () {
                  onTapCheckButton(studyType, index);
                },
                onTapSaveButton: () {
                  tapSavedButton(studyType, index);
                });
          },
        ),
      ],
    );
  }
}
