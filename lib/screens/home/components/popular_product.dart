import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/product_card.dart';
import 'package:ui_ecommerce/model/Product.dart';
import 'package:ui_ecommerce/screens/details/details_screen.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              demoProducts.length,
              (index) {
                final product = demoProducts[index];
                return ProductCard(
                  product: product,
                  press: () {
                    Navigator.pushNamed(
                      context,
                      DetailScreen.routeName,
                      arguments: product,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
