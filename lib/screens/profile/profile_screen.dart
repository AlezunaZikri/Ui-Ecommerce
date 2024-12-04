import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, theme, child) => IconButton(
              icon: Icon(
                theme.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                theme.toggleTheme(!theme.isDarkMode);
              },
            ),
          ),
        ],
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
