import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/pages/detail.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  product: product,
                )));
      },
      child: Container(
        // color: Colors.amber,
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 180,
                width: 160,
                decoration: const BoxDecoration(
                    color: Color(0xffF7F7F6),
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: Center(
                  // child: Image.network(
                  //   product.image,
                  //   height: 140,
                  //   width: 140,
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    height: 140,
                    width: 140,
                    progressIndicatorBuilder: (context, url, progress) {
                      return CircularProgressIndicator(
                        value: progress.downloaded.toDouble(),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 5.0),
              child: Text(
                product.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 4.0),
              child: Text(
                "\$${product.price}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
