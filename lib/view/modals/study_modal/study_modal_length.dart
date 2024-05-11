part of 'study_modal.dart';

///問題数指定
class _SelectLength extends ConsumerWidget {
  const _SelectLength();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> selectLength = [5, 10, 20];

    final selectedStudyLength = ref.watch(
      homeQuizScreenProvider.select((state) => state.selectedStudyLength),
    );

    final initialIndex = selectLength.indexOf(selectedStudyLength);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '問題数を選択してください。',
          style: TextStyle(fontSize: 14),
        ),
        const Gap(10),
        Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: context.secondColor),
          ),
          child: DefaultTabController(
            length: 3,
            initialIndex: initialIndex,
            child: TabBar(
                onTap: (index) {
                  ref
                      .read(homeQuizScreenProvider.notifier)
                      .setStudyLength(selectLength[index]);
                },
                labelColor: context.mainColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black54,
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.normal),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.5, color: context.mainColor),
                    color: context.backgroundColor.withOpacity(0.5)),
                tabs: [
                  Tab(
                    child: Text(
                      "${selectLength[0]}問",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${selectLength[1]}問",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${selectLength[2]}問",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
