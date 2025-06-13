import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/features/auth/presentation/views/auth_view.dart';
import 'package:movies_app/features/home/presentation/views/home_view.dart';
import '../../../../../core/services/shared_pref_service.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  SplashViewBodyState createState() => SplashViewBodyState();
}

class SplashViewBodyState extends State<SplashViewBody> {
  bool _isImageLoaded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// ✅ تحميل الصورة مسبقًا عند توفر `context`
    precacheImage(AssetImage(Assets.assetsImagesSplahMovies), context)
        .then((_) {
      if (mounted) {
        setState(() {
          _isImageLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// ✅ تجنب استخدام `MediaQuery` إلا بعد تحميل الصورة
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: !_isImageLoaded
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ) // ⏳ عرض تحميل قبل ظهور الصورة
          : Stack(
              children: [
                /// ✅ عرض الصورة بعد تحميلها بالكامل
                Positioned.fill(
                  child: Image.asset(
                    Assets.assetsImagesSplahMovies,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: screenHeight / 2,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Movie Flix",
                            textStyle: AppTextStyles.robotoBold48(context),
                            speed: const Duration(milliseconds: 250),
                            curve: Curves.bounceIn,
                            cursor: "",
                          ),
                        ],
                        displayFullTextOnTap: true,
                        totalRepeatCount: 2,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText(
                            'Movies at your fingertips.',
                            textStyle: AppTextStyles.regular16(context)
                                .copyWith(color: Colors.white),
                            duration: const Duration(seconds: 2),
                            fadeInEnd: 0.7,
                            fadeOutBegin: 0.9,
                          ),
                        ],
                        displayFullTextOnTap: true,
                        totalRepeatCount: 2,
                        onFinished: () async {
                          await Future.delayed(
                              const Duration(milliseconds: 200));
                          final ifUserNotSignIn =
                              FirebaseAuth.instance.currentUser == null;
                          final bool isOnboardingShow =
                              SharedPrefService().showOnboarding();

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (ifUserNotSignIn && !isOnboardingShow) {
                              Navigator.of(context).pushReplacementNamed(
                                  OnBoardingView.routeName);
                            } else if (ifUserNotSignIn && isOnboardingShow) {
                              Navigator.of(context)
                                  .pushReplacementNamed(AuthView.routeName);
                            } else if (!ifUserNotSignIn && isOnboardingShow) {
                              Navigator.of(context)
                                  .pushReplacementNamed(HomeView.routeName);
                            }
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
