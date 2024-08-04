part of '../home_learn_screen.dart';

///クイズ問題
class _Question extends ConsumerWidget {
  const _Question({required this.quizItem, required this.isAnsView});

  final QuizItem quizItem;
  final bool isAnsView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: context.width * 0.01, right: context.width * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedSwitcher(
            // アニメーションがおかしい
            duration: const Duration(milliseconds: 0),
            // reverseDuration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child: isAnsView ? _AnsQuestion(quizItem) : _ConfirmQuestion(quizItem),
          ),
        ],
      ),
    );
  }
}

///穴埋め問題(答え)
class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.quizItem);

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubstringHighlight(
      text: quizItem.comment,
      term: quizItem.word,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
      textStyleHighlight: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: context.mainColor,
        decoration: TextDecoration.underline,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
    );
  }
}

///穴埋め問題
class _ConfirmQuestion extends ConsumerWidget {
  const _ConfirmQuestion(this.quizItem);

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubstringHighlight(
      text: quizItem.comment.replaceAll(quizItem.word, I18n().hideText(quizItem.word)),
      term: quizItem.word,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
      textStyleHighlight: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: context.mainColor,
        decoration: TextDecoration.underline,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
    );
  }
}
