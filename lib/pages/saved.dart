import 'package:flutter/material.dart';
import 'package:shopping_app/components/custom_app_bar/custom_app_bar.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: "Saved",
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Center(
        child: Text("saved"),
      ),
    );
  }
}
