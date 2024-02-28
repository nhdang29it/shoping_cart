import 'package:flutter/material.dart';
import 'package:shopping_app/pages/detail.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const DetailPage()));
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
                  child: Image.asset(
                    "assets/images/bag.jpg",
                    height: 140,
                    width: 140,
                    // fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 5.0),
              child: Text(
                "Beosound A1",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 4.0),
              child: Text(
                "\$750",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
