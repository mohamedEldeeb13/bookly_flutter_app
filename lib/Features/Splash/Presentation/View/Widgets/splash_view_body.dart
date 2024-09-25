import 'package:bookly_flutter_app/Core/Utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:bookly_flutter_app/Features/Splash/Presentation/View/Widgets/splash_animated_image.dart';
import 'package:bookly_flutter_app/Features/Splash/Presentation/View/Widgets/splash_animated_text.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> imageSlidingAnimation;
  late Animation<Offset> textSlidingAnimation;

  @override
  void initState() {
    super.initState();

    initAnimation();
    navigationToHomeView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SplashAnimatedImage(imageSlidingAnimation: imageSlidingAnimation),
        const SizedBox(
          height: 4,
        ),
        SplashAnimatedText(textSlidingAnimation: textSlidingAnimation),
      ],
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    imageSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, -3), end: Offset.zero)
            .animate(animationController);

    textSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 8), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigationToHomeView() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
