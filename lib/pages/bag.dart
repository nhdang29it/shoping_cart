import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/product/product_bloc.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/components/bag/item_tile.dart';
import 'package:shopping_app/components/custom_app_bar/custom_app_bar.dart';
import 'package:shopping_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/models/cart_model.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>();

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
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 24.0),
            child: Text(
              "${cartState.state.products.length} Items",
              style: const TextStyle(fontSize: 16, color: Color(0XFFDDDFE2)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Expanded(
                child: state.products.isEmpty
                    ? const Center(
                        child: Text("Empty cart"),
                      )
                    : ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final ProductItem productItem = state.products[index];
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(24.0, 6.0, 0, 6.0),
                            child: ItemTile(
                              productItem: productItem,
                              index: index,
                            ),
                          );
                        },
                      ),
              );
            },
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: borderColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "\$${cartState.getTotal(context.read<ProductBloc>()).toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
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
