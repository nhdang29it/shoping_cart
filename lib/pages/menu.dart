import 'package:flutter/material.dart';
import 'package:shopping_app/components/custom_app_bar/custom_app_bar.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: "Menu",
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Center(
        child: Text("menu"),
      ),
    );
  }
}
