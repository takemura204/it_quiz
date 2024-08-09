part of '../study_modal.dart';

class _RangeMenu extends HookConsumerWidget {
  const _RangeMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '出題範囲',
            style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          Gap(10),
          _RangeList(),
        ],
      ),
    );
  }
}

class _RangeList extends HookConsumerWidget {
  const _RangeList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ['ああああああああ', 'いいいいいい', 'ううううううううううううう'];
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: [
        ...filterList.map((stockTheme) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                stockTheme,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}
