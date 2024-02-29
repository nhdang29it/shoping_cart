import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/product/product_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/components/bottom_nav_bar/bottom_item_model.dart';
import 'package:shopping_app/components/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:shopping_app/cubits/app_cubit/app_cubit.dart';
import 'package:shopping_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/pages/explore.dart';
import 'package:shopping_app/pages/menu.dart';
import 'package:shopping_app/pages/saved.dart';
import 'package:shopping_app/services/dio_service.dart';
import 'colors.dart';
import 'package:shopping_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(itemCount: 4)),
        BlocProvider(
            create: (context) =>
                ProductBloc(productRepository: ProductRepository())
                  ..add(GetAllProductEvent())),
        BlocProvider(
            create: (context) => CartCubit()
              ..state.copyWith(
                  status: CartStatus
                      .success)) // init cart cubit and then set status to success bacause cart state dont save and load data in any storage
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          fontFamily: "BeVNPro",
          useMaterial3: true,
        ),
        home: BlocBuilder<AppCubit, int>(
          builder: (context, state) {
            return Scaffold(
              body: IndexedStack(
                index: state,
                children: const [Home(), Explore(), Saved(), Menu()],
              ),
              bottomNavigationBar: BottomNavBar(
                currentIndex: state,
                items: const [
                  BottomItemModel(
                    svgIconPath: "assets/icons/home_icon.svg",
                    label: "Home",
                  ),
                  BottomItemModel(
                    svgIconPath: "assets/icons/explore_icon.svg",
                    label: "Explore",
                  ),
                  BottomItemModel(
                    svgIconPath: "assets/icons/saved_icon.svg",
                    label: "Saved",
                  ),
                  BottomItemModel(
                    svgIconPath: "assets/icons/menu_icon.svg",
                    label: "Menu",
                  ),
                ],
              ),
              // bottomNavigationBar: const MyBottomNavBar(),
            );
          },
        ),
      ),
    );
  }
}
