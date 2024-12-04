import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/screens/cart/cart_screen.dart';
import 'package:ui_ecommerce/screens/home/components/icon_with_trigger.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'search_field.dart';

class HeaderHomePart extends StatelessWidget {
  const HeaderHomePart({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi TextEditingController untuk search
    // TextEditingController searchController = TextEditingController();

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: SearchField(),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
            child: Consumer<CartProvider>(
              builder: (context, cart, child) => IconWithTrigger(
                svgIcon: "assets/icons/Cart Icon.svg",
                trigger: cart.cartItems.length.toString(),
              ),
            ),
          ),
          // Icon Notification
          Consumer<CartProvider>(
            builder: (context, cart, child) => const IconWithTrigger(
              svgIcon: "assets/icons/Bell.svg",
            ),
          ),
        ],
      ),
    );
  }
}
