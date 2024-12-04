import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/screens/splash/splash_screen.dart';
import 'package:ui_ecommerce/state_managements/auth_provider.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 13),
          Consumer<AuthProvider>(
              builder: (context, email, child) => Text(
                    email.savedEmail,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  )),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Provider.of<AuthProvider>(context, listen: false).setAuth(false);
              Navigator.pushNamedAndRemoveUntil(context, SplashScreen.routeName,
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
