import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/coustom_bottom_nav_bar.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/favorite/components/body.dart';
import 'package:ui_ecommerce/state_managements/favorite_provider.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/fav";
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: Column(
        children: [
          const Text(
            "Your Favorites",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Consumer<FavoriteProvider>(
            builder: (context, favourite, child) => Text(
                "${favourite.favouriteProducts.length} items",
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
