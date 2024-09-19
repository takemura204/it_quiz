part of '../home_search_screen.dart';

class _SearchHeader extends ConsumerWidget {
  const _SearchHeader({required this.isNotTextEmpty, required this.textEditingController});

  final bool isNotTextEmpty;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.005),
      child: Card(
        elevation: 1,
        child: Container(
          color: context.secondColor,
          padding: EdgeInsets.all(context.width * 0.02),
          child: SearchTextField(
            searchController: textEditingController,
            isTextEmpty: isNotTextEmpty,
            onChanged: (_) {
              ref.read(homeSearchScreenProvider.notifier).setSearchText(textEditingController.text);
            },
            onFieldSubmitted: (_) {
              ref
                  .read(homeSearchScreenProvider.notifier)
                  .setSearchKeywords(textEditingController.text);
            },
            onClear: () {
              ref.read(homeSearchScreenProvider.notifier).clearSearchText();
            },
          ),
        ),
      ),
    );
  }
}
