import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photos_fake/src/ui/pages/pages.dart';
import 'package:photos_fake/src/utils/responsive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return AnimatedSplashScreen(
      nextScreen: const HomePage(),//const LoginPage(),
      splash: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/Google-Photos-logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: responsive.heightResponsive(10),
          ),
          Text(
            'Photos Fake',
            style: GoogleFonts.poppins(
              fontSize: 30,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      splashIconSize: 250,
      backgroundColor: Colors.white,
      duration: 2000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
