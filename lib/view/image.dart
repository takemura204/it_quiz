import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/auth/auth_controller.dart';

class Tutorial extends ConsumerWidget {
  const Tutorial();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentImageIndex = ref.watch(authProvider).currentImageIndex;
    final images = ref.watch(authProvider.notifier).images;
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
                ref.read(authProvider.notifier).setImageIndex(index);
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
              // child: Image.asset(
              //   images[itemIndex],
              //   fit: BoxFit.cover,
              child: Center(
                child: Text(
                  "画面" + itemIndex.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
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
            effect: const WormEffect(
              strokeWidth: 0.5,
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.black87,
              dotColor: Colors.black87,
              paintStyle: PaintingStyle.stroke,
            ),
          ),
        ),
      ],
    );
  }
}
