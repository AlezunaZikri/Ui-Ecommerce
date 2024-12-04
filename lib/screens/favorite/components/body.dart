import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/Product.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'package:ui_ecommerce/state_managements/favorite_provider.dart';
export 'package:ui_ecommerce/model/Product.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favourite, child) => ListView.builder(
        itemCount: favourite.favouriteProducts.length,
        itemBuilder: (context, index) {
          final Product product = favourite.favouriteProducts[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(10),
            ),
            child: Slidable(
              key: Key(product.id.toString()),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      Provider.of<CartProvider>(context, listen: false)
                          .addCartItem(Cart(product: product, numOfItem: 1));
                      favourite.toggleFavoriteStatus(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.title} added to cart'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icons.shopping_cart,
                    label: 'Cart',
                    backgroundColor: kPrimaryColor,
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      favourite.toggleFavoriteStatus(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${product.title} removed from favourite'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icons.delete,
                    label: 'Delete',
                    backgroundColor: Colors.red,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(88),
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(20)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kSecondaryColor.withOpacity(0.2),
                        ),
                        child: product.images.isNotEmpty
                            ? Image.asset(product.images[0])
                            : const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(),
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$${product.price}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
