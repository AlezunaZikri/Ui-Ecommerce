import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().cartItems;

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final Cart cartData = cartItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cartData.product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              context.read<CartProvider>().removeCartItem(cartData);
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: cartData),
          ),
        );
      },
    );
  }
}
