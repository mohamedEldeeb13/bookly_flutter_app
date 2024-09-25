import 'package:flutter/material.dart';

import '../../../../../Core/Utils/assets.dart';

class SplashAnimatedImage extends StatelessWidget {
  const SplashAnimatedImage({
    super.key,
    required this.imageSlidingAnimation,
  });

  final Animation<Offset> imageSlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: imageSlidingAnimation,
        builder: (context, _) {
          return SlideTransition(
              position: imageSlidingAnimation,
              child: Center(child: Image.asset(AssetsData.logo)));
        });
  }
}
