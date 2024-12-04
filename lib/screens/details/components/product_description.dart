import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/Product.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/favorite_provider.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: const BoxDecoration(
                // Background color balik ke default (tidak tergantung pada isFavourite)
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Consumer<FavoriteProvider>(
                builder: (context, favorite, child) => IconButton(
                  icon: Icon(
                    // Icon warna hati balik seperti semula
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                  onPressed: () {
                    // Masih tetap mengganti status favorit
                    favorite.toggleFavoriteStatus(product.id);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64),
            ),
            child: Text(
              product.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: pressOnSeeMore,
              child: const Row(
                children: [
                  Text(
                    "See More Detail",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
