import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/models/product_model.dart';

class ProductProperty extends StatelessWidget {
  const ProductProperty({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 7,
                child: buildTextAndPrice(
                    text: product.title, price: "\$${product.price}")),
            listProdColor.isNotEmpty
                ? const Expanded(
                    flex: 4,
                    child: SelectColorGroup(
                      listColor: listProdColor,
                      currentColor: 2,
                    ),
                  )
                : const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SelectColorGroup extends StatefulWidget {
  const SelectColorGroup(
      {required this.listColor, required this.currentColor, super.key});

  final List<Color> listColor;
  final int currentColor;

  @override
  State<SelectColorGroup> createState() => _SelectColorGroupState();
}

class _SelectColorGroupState extends State<SelectColorGroup> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.listColor.map<Widget>((e) {
            if (widget.listColor.indexOf(e) == widget.currentColor) {
              return SelectColor(
                isSelected: true,
                color: e,
                onTap: () {
                  print(widget.listColor.indexOf(e));
                },
              );
            }
            return SelectColor(
              color: e,
              onTap: () {
                print(widget.listColor.indexOf(e));
              },
            );
          }).toList()),
    );
  }
}

class SelectColor extends StatelessWidget {
  const SelectColor(
      {this.isSelected = false, this.onTap, required this.color, super.key});

  final bool isSelected;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              width: 30,
              height: 60,
              margin: const EdgeInsets.only(right: 2, left: 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(36)),
                  border: Border.fromBorderSide(
                    BorderSide(width: 0.5, color: color),
                  ),
                  color: Colors.white),
              child: Center(
                child: Container(
                  width: 26,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(36)),
                      color: color),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              width: 26,
              height: 55,
              margin: const EdgeInsets.only(right: 2, left: 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(36)),
                  color: color),
            ),
          );
  }
}

Widget buildTextAndPrice({required String text, required String price}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 2.0),
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, wordSpacing: 1.5),
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.clip,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 2.0),
          child: Text(
            price,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
