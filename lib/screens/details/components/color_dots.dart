import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/rounded_icon_btn.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/Product.dart';
import 'package:ui_ecommerce/size_config.dart';



class ColorDots extends StatefulWidget {
  const ColorDots({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {

    int selectedColor = 0;
    int totalselected = 1;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
          Row(
            children: [
              RoundedIconBtn(
                icon: Icons.remove,
                press: totalselected > 1 ? () {
                  setState(() {
                    totalselected--;
                  });
                }:null
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text('$totalselected'),
              SizedBox(width: getProportionateScreenWidth(20)),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {
                  setState(() {
                    totalselected++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(2),
      height: getProportionateScreenWidth(isSelected ? 40 : 30),
      width: getProportionateScreenWidth(isSelected ? 40 : 30),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
