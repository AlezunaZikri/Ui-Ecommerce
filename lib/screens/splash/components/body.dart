import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/splash_data.dart';
import 'package:ui_ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ui_ecommerce/screens/splash/components/splash_content.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) => setState(() => currentPage = value),
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text']!,
                  image: splashData[index]['image']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => dotBuilder(index: index),
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    MyDefaultButton(
                      text: 'Continue',
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer dotBuilder({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 2.5, left: 2.5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

