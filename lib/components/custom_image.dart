import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key,
      required this.bgHeight,
      required this.bgWidth,
      required this.imgHeight,
      required this.imgWidth,
      this.progressIndicatorBuilder,
      this.errorWidget,
      this.onTap,
      required this.imageUrl});

  final double bgHeight, bgWidth, imgHeight, imgWidth;
  final String imageUrl;
  final Widget Function(
          BuildContext context, String url, DownloadProgress progress)?
      progressIndicatorBuilder;
  final Widget Function(BuildContext context, String url, Object error)?
      errorWidget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: bgHeight,
        width: bgWidth,
        decoration: const BoxDecoration(
            color: Color(0xffF7F7F6),
            borderRadius: BorderRadius.all(Radius.circular(22))),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: imgHeight,
            width: imgWidth,
            progressIndicatorBuilder: progressIndicatorBuilder,
            errorWidget: errorWidget,
          ),
        ),
      ),
    );
  }
}
