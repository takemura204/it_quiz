part of '../quiz_modal.dart';

class _StudyTypeMenu extends HookConsumerWidget {
  const _StudyTypeMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStudyTypeTabIndex =
        ref.watch(homeQuizModalProvider.select((state) => state.selectedStudyTypeTabIndex));
    final controller = ref.read(homeQuizModalProvider.notifier);

    return Container(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MenuTitle(title: '学習形式'),
          const Gap(10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: context.secondColor),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: selectedStudyTypeTabIndex,
                      child: TabBar(
                        onTap: (index) {
                          HapticFeedback.lightImpact();
                          controller.setStudyType(index);
                        },
                        labelColor: context.mainColor,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.black54,
                        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1.5, color: context.mainColor),
                          color: context.backgroundColor.withOpacity(0.5),
                        ),
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/list.svg',
                                  width: 30,
                                  height: 30,
                                  colorFilter: ColorFilter.mode(
                                    selectedStudyTypeTabIndex == 0
                                        ? context.mainColor
                                        : Colors.black38,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  I18n().studyTypeText(StudyType.choice),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/swipe_cards.svg',
                                  width: 30,
                                  height: 30,
                                  colorFilter: ColorFilter.mode(
                                    selectedStudyTypeTabIndex == 1
                                        ? context.mainColor
                                        : Colors.black38,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  I18n().studyTypeText(StudyType.learn),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(5),
        ],
      ),
    );
  }
}
