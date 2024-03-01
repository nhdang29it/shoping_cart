import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/components/custom_app_bar/custom_app_bar.dart';
import 'package:shopping_app/components/details/content_image.dart';
import 'package:shopping_app/components/details/mini_images.dart';
import 'package:shopping_app/components/details/product_property.dart';
import 'package:shopping_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/models/product_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({required this.product, super.key});

  final ProductModel product;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Details",
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContentImage(
                image: widget.product.image,
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
            MiniImages(images: [widget.product.image]),
            ProductProperty(
              product: widget.product,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.product.description,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() => Container(
        height: 120,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: borderColor)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 14.0),
              decoration: const BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.all(Radius.circular(26)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 35,
                    width: 42,
                    child: IconButton(
                        onPressed: () {
                          if (quantity > 0) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        style: IconButton.styleFrom(
                            splashFactory: NoSplash.splashFactory),
                        iconSize: 20,
                        icon: const Icon(
                          Icons.remove,
                        )),
                  ),
                  SizedBox(
                    height: 35,
                    width: 42,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        iconSize: 20,
                        style: IconButton.styleFrom(
                            splashFactory: NoSplash.splashFactory),
                        icon: const Icon(
                          Icons.add,
                        )),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "QTY: ",
                style: const TextStyle(color: borderColor, fontSize: 22),
                children: [
                  TextSpan(
                    text: quantity.toString(),
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (quantity > 0) {
                  context
                      .read<CartCubit>()
                      .addItemToCart(widget.product, quantity);
                  setState(() {
                    quantity = 0;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(155, 65)),
              child: const Text("Add to Bag"),
            )
          ],
        ),
      );
}
