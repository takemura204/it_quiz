part of 'study_modal.dart';

class _Title extends ConsumerWidget {
  const _Title(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      quiz.title,
      style: context.texts.titleLarge,
    );
  }
}
