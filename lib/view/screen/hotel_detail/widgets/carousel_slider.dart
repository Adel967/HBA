import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider(
      {super.key, required this.imagesUrl, required this.isNetWork});
  final List<String> imagesUrl;
  final bool isNetWork;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController();
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == widget.imagesUrl.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: size.height * 0.35,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.imagesUrl.length,
              itemBuilder: (context, index) {
                final imageUrl = widget.imagesUrl[index];
                return Hero(
                  tag: imageUrl,
                  child: ImagePlaceHolder(
                    isNetwork: widget.isNetWork,
                    imageUrl: imageUrl,
                  ),
                );
              },
            ),
            IgnorePointer(
              ignoring: true,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: widget.imagesUrl.length,
                    effect: SwapEffect(
                      activeDotColor: Colors.white70,
                      dotColor: Colors.white38,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder(
      {super.key, required this.isNetwork, required this.imageUrl});
  final bool isNetwork;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          )
        : Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          );
  }
}
