part of 'home_review_screen.dart';

///タップできないボタン
class _NullQuizButton extends ConsumerWidget {
  const _NullQuizButton({required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: null,
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.all(20),
            child: Container(
              height: context.height * 0.15,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: context.width * 0.05,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///クイズボタン
class _QuizButton extends ConsumerWidget {
  const _QuizButton(
      {required this.title,
      required this.subTitle,
      required this.icon,
      required this.onTap});

  final String title;
  final String subTitle;
  final IconData? icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.all(20),
          child: Container(
            height: context.height * 0.15,
            alignment: Alignment.center,
            // padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.onMain50,
              border: Border.all(
                color: context.colors.main50.withOpacity(0.7),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Icon(
                      icon,
                      size: context.width * 0.1,
                    ),
                    const Gap(10),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: context.width * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Gap(5),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: context.width * 0.04,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
