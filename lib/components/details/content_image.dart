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
                child: Image.asset(
                  image,
                  height: 140,
                  width: 140,
                  // fit: BoxFit.contain,
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
