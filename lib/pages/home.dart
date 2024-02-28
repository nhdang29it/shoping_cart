import 'package:flutter/material.dart';
import 'package:shopping_app/components/custom_app_bar/custom_app_bar.dart';
// import 'package:shopping_app/components/bottom_nav_bar/bottom_item_model.dart';
// import 'package:shopping_app/components/bottom_nav_bar/bottom_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: "Home",
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
