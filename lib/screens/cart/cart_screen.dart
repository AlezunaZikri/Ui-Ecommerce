import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          // Mengirimkan total harga ke CheckoutCard
          return CheckoutCard(
            totalPrice: cartProvider.cartItems.fold(
              0.0,
              (sum, item) => sum + (item.product.price * item.numOfItem),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.white),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) => Text(
              "${cart.cartItems.length} items",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
