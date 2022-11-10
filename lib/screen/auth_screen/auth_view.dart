part of 'auth_screen.dart';

class _Tutorial extends ConsumerWidget {
  const _Tutorial();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentImageIndex =
        ref.watch(authScreenControllerProvider).currentImageIndex;
    final images = ref.watch(authScreenControllerProvider.notifier).images;
    return Column(
      children: [
        ///チュートリアル画面
        Container(
          height: context.height * 0.35,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: context.height * 0.35,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                ref
                    .read(authScreenControllerProvider.notifier)
                    .changeImageIndex(index);
              },
              scrollDirection: Axis.horizontal,
            ),
            itemCount: images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              width: context.width,
              height: context.height * 0.35,
              decoration: const BoxDecoration(color: Colors.amber),
              child: Image.asset(
                images[itemIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        ///インジケーター
        Container(
          height: context.height * 0.05,
          child: AnimatedSmoothIndicator(
            count: images.length,
            activeIndex: currentImageIndex,
            curve: Curves.decelerate,
            effect: WormEffect(
              strokeWidth: 0.5,
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: context.colors.dark87,
              dotColor: context.colors.dark87,
              paintStyle: PaintingStyle.stroke,
            ),
          ),
        ),
      ],
    );
  }
}
