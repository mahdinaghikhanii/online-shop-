import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  final PageController _controller = PageController();
  BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller,
                itemCount: 2,
                itemBuilder: (context, index) {
                  final baneeerLocal = [
                    "assets/img/women.png",
                    "assets/img/men.png"
                  ];
                  return _Slider(imageAddres: baneeerLocal[index]);
                }),
            Positioned(
                right: 0,
                bottom: 30,
                left: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    axisDirection: Axis.horizontal,
                    effect: ExpandingDotsEffect(
                        spacing: 10.0,
                        radius: 4.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        paintStyle: PaintingStyle.fill,
                        strokeWidth: 1.5,
                        dotColor: Colors.white,
                        activeDotColor: Theme.of(context).colorScheme.primary),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final String imageAddres;
  const _Slider({required this.imageAddres});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        child: Image.asset(
          imageAddres,
          fit: BoxFit.cover,
        ));
  }
}
