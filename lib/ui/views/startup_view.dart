import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medium/core/constants/asset_images.dart';
import 'package:medium/ui/shared/colors.dart';
import 'package:medium/ui/shared/text_styles.dart';
import 'package:medium/ui/widgets/animation/slide_in.dart';
import 'package:medium/ui/widgets/social_button.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key key}) : super(key: key);

  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  final kOpacityDuration = const Duration(milliseconds: 800);
  final kPositionedDuration = const Duration(milliseconds: 800);

  bool _startMovingUp = false;
  bool _startOpacityAnimation = false;
  bool _startOpacityAnimation2 = false;
  bool _startOpacityAnimation3 = false;
  bool _startOpacityAnimation4 = false;

  @override
  void initState() {
    Timer(Duration(milliseconds: 600), () {
      setState(() => _startMovingUp = true);
    });
    Timer(Duration(milliseconds: 1500), () {
      setState(() => _startOpacityAnimation = true);
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() => _startOpacityAnimation2 = true);
    });
    Timer(Duration(milliseconds: 1900), () {
      setState(() => _startOpacityAnimation3 = true);
    });
    Timer(Duration(milliseconds: 2100), () {
      setState(() => _startOpacityAnimation4 = true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final centerHeight = MediaQuery.of(context).size.height / 2 - topPadding;
    final headingStyle = AppTextStyles.heading2
        .copyWith(color: AppColors.splash_screen_heading_text);
    final largerHeadingStyle = headingStyle.copyWith(fontSize: 30);

    return Scaffold(
      backgroundColor: AppColors.splash_screen_background,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 40),
        child: AnimatedPadding(
          padding: EdgeInsets.only(
            top: _startMovingUp
                ? 40
                : centerHeight - largerHeadingStyle.fontSize / 2,
          ),
          duration: const Duration(seconds: 1),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AnimatedDefaultTextStyle(
                    duration: const Duration(seconds: 1),
                    child: Text('Medium'),
                    style: _startMovingUp ? headingStyle : largerHeadingStyle,
                  ),
                  SizedBox(height: 80),
                  SlideIn(
                    msDelay: 600,
                    child: Text(
                      'Smart stories for curious people.',
                      style: AppTextStyles.heading1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                  SlideIn(
                    msDelay: 700,
                    child: Text(
                      'Get started by creating your account.',
                      style: AppTextStyles.body
                          .copyWith(color: AppColors.splash_screen_body_text),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  AnimatedOpacity(
                    opacity: _startOpacityAnimation ? 1 : 0,
                    duration: kOpacityDuration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SocialButton(
                        title: 'Sign up with Google',
                        svgAssetPath: AssetImages.google_logo,
                        backgroundColor: AppColors.social_button_color,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  AnimatedOpacity(
                    opacity: _startOpacityAnimation2 ? 1 : 0,
                    duration: kOpacityDuration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SocialButton(
                        title: 'Sign up with Facebook',
                        svgAssetPath: AssetImages.facebook_logo,
                        backgroundColor: AppColors.social_button_color,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  AnimatedOpacity(
                    opacity: _startOpacityAnimation3 ? 1 : 0,
                    duration: kOpacityDuration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SocialButton(
                        title: 'Sign up with email',
                        svgAssetPath: AssetImages.email_logo,
                        backgroundColor: AppColors.social_button_color,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  AnimatedOpacity(
                    opacity: _startOpacityAnimation4 ? 1 : 0,
                    duration: kOpacityDuration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SocialButton(
                        title: 'Sign up with Apple',
                        svgAssetPath: AssetImages.apple_logo,
                        backgroundColor: AppColors.social_button_color,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: _startOpacityAnimation ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    child: _SignIn(),
                  ),
                  SizedBox(height: 100),
                  AnimatedOpacity(
                    opacity: _startOpacityAnimation ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    child: _TermsOfService(),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignIn extends StatelessWidget {
  const _SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.body
            .copyWith(color: AppColors.splash_screen_body_text),
        children: [
          TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Sign in',
            style: AppTextStyles.body
                .copyWith(color: AppColors.splash_screen_link),
          ),
        ],
      ),
    );
  }
}

class _TermsOfService extends StatelessWidget {
  const _TermsOfService({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.fineText.copyWith(
            color: AppColors.splash_screen_body_text,
          ),
          children: [
            TextSpan(text: 'By creating an account, I accept Medium\'s '),
            TextSpan(
              text: 'Terms of Service',
              style: AppTextStyles.fineText.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
