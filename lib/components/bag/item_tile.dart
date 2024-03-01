import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopping_app/components/custom_image.dart';
import 'package:shopping_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/pages/detail.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({required this.productItem, required this.index, super.key});

  final ProductItem productItem;
  final int index;
  final double itemTileHeight = 90;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (ctx) {
              ctx.read<CartCubit>().deleteProductItem(productItem: productItem);
            },
            // flex: 10,
            padding: const EdgeInsets.only(left: 8.0),
            backgroundColor: const Color(0XFFFEFBF1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(42),
              bottomLeft: Radius.circular(42),
            ),
            child: Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10.0),
              decoration: const BoxDecoration(
                  color: Color(0XFFFDF3D6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                    bottomLeft: Radius.circular(42),
                  )),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(42),
                      bottomLeft: Radius.circular(42),
                    )),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.close_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Remove",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: SizedBox(
        height: itemTileHeight,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomImage(
                bgHeight: 80,
                bgWidth: 80,
                imgHeight: 60,
                imgWidth: 60,
                imageUrl: productItem.product.image,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(product: productItem.product)));
                },
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0),
                    child: Text(
                      productItem.product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0),
                    child: Text(
                      "\$${productItem.product.price}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "QTY: ",
                style: const TextStyle(color: borderColor, fontSize: 18),
                children: [
                  TextSpan(
                    text: productItem.quantity.toString(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              // decrease/increase quantity
              height: itemTileHeight - 10,
              margin: const EdgeInsets.only(left: 14.0, right: 14.0),
              decoration: const BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.all(Radius.circular(26)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 35,
                    width: 40,
                    child: IconButton(
                        onPressed: () {
                          context
                              .read<CartCubit>()
                              .decreaseQuantity(productIndex: index);
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
                    width: 40,
                    child: IconButton(
                        onPressed: () {
                          context
                              .read<CartCubit>()
                              .increaseQuantity(productIndex: index);
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
          ],
        ),
      ),
    );
  }
}
