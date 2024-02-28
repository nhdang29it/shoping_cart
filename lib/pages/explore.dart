import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/custom_app_bar/custom_app_bar.dart';
import 'package:shopping_app/components/grid_item.dart';
import 'package:shopping_app/cubits/cubit/app_cubit.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Explore",
        leading: IconButton(
            onPressed: () {
              context.read<AppCubit>().goHome();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        badge: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GridView.builder(
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 5,
              mainAxisExtent: 262),
          itemBuilder: (context, index) {
            return Transform.translate(
              offset: Offset(0, index.isOdd ? 23 : 0),
              child: const CustomGridItem(),
            );
          },
        ),
      ),
    );
  }
}
