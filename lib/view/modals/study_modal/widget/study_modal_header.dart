part of '../study_modal.dart';

class _Header extends ConsumerWidget {
  const _Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () {},
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
