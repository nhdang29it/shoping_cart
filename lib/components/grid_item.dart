import 'package:flutter/material.dart';
import 'package:shopping_app/components/custom_image.dart';
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
        // color: Color.fromARGB(255, 221, 223, 253),
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomImage(
                  bgHeight: 180,
                  bgWidth: 160,
                  imgHeight: 140,
                  imgWidth: 140,
                  progressIndicatorBuilder: (context, url, progress) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_rounded),
                  imageUrl: product.image),
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
