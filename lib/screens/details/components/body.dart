import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/components/rounded_icon_btn.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/model/Product.dart';
import 'package:ui_ecommerce/screens/details/components/color_dots.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({super.key, required this.product});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int totalSelected = 1;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: kPrimaryColor,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                          ...List.generate(
                            widget.product.colors.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: ColorDot(
                                color: widget.product.colors[index],
                                isSelected: index == selectedColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          // Bagian untuk mengatur jumlah produk
                          Row(
                            children: [
                              RoundedIconBtn(
                                icon: Icons.remove,
                                press: totalSelected > 1
                                    ? () {
                                        setState(() {
                                          totalSelected--;
                                        });
                                      }
                                    : null,
                              ),
                              SizedBox(width: getProportionateScreenWidth(20)),
                              Text('$totalSelected'),
                              SizedBox(width: getProportionateScreenWidth(20)),
                              RoundedIconBtn(
                                icon: Icons.add,
                                showShadow: true,
                                press: () {
                                  setState(() {
                                    totalSelected++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TopRoundedContainer(
                      color: kPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: MyDefaultButton(
                          text: "Add To Cart",
                          press: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addCartItem(Cart(
                              product: widget.product,
                              numOfItem: totalSelected,
                            ));

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Added to Cart"),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
