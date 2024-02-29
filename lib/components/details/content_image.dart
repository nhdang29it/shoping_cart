import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContentImage extends StatelessWidget {
  const ContentImage({required this.image, required this.icon, super.key});

  final String image;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Stack(children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          // color: Colors.amberAccent,
          child: Center(
            child: Container(
              height: 260,
              width: 260,
              decoration: const BoxDecoration(
                color: Color(0xffF7F7F6),
                shape: BoxShape.circle,
              ),
              child: Center(
                // child: Image.network(
                //   image,
                //   height: 140,
                //   width: 140,
                //   loadingBuilder: (context, child, loadingProgress) {
                //     if (loadingProgress == null) return child;
                //     return Center(
                //       child: CircularProgressIndicator(
                //           value: loadingProgress.expectedTotalBytes != null
                //               ? loadingProgress.cumulativeBytesLoaded /
                //                   loadingProgress.expectedTotalBytes!
                //               : null,
                //           ),
                //     );
                //   },
                //   // fit: BoxFit.contain,
                // ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 260,
                  width: 260,
                  progressIndicatorBuilder: (context, url, progress) {
                    return CircularProgressIndicator(
                      value: progress.downloaded.toDouble(),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 10,
          child: CircleAvatar(
            backgroundColor: const Color(0xffF7F7F6),
            radius: 26,
            child: icon,
          ),
        ),
      ]),
    );
  }
}
