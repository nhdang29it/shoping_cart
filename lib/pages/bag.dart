import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/components/bag/item_tile.dart';
import 'package:shopping_app/components/custom_app_bar/custom_app_bar.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Bag",
        disableAction: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Your Bag",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 24.0),
            child: Text(
              "8 Items",
              style: TextStyle(fontSize: 16, color: Color(0XFFDDDFE2)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 6.0, 0, 6.0),
                  child: ItemTile(),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: borderColor)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: borderColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("\$2250.00",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(155, 65)),
              child: const Text("Chackout"),
            )
          ],
        ),
      ),
    );
  }
}
