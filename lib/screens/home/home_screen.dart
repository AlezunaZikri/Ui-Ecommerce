import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/home/components/body.dart';
import 'package:ui_ecommerce/size_config.dart';


class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

   

    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
