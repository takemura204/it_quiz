part of '../search_modal.dart';

class _MenuTitle extends HookConsumerWidget {
  const _MenuTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        const Gap(3),
        Divider(color: Colors.grey.shade500, height: 0.5),
      ],
    );
  }
}
