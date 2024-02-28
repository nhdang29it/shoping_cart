import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/components/bottom_nav_bar/bottom_item_model.dart';
import 'package:shopping_app/cubits/cubit/app_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({this.currentIndex = 0, required this.items, super.key});

  final List<BottomItemModel> items;
  final int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: borderColor)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (BottomItemModel e in widget.items)
              InkWell(
                onTap: widget.currentIndex == widget.items.indexOf(e)
                    ? null
                    : () {
                        context
                            .read<AppCubit>()
                            .changeIndex(widget.items.indexOf(e));
                      },
                borderRadius: BorderRadius.circular(25.0),
                radius: 26,
                splashColor: primary.withOpacity(0.6),
                highlightColor: const Color.fromARGB(116, 211, 211, 211),
                child: SizedBox(
                  height: 65,
                  width: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        e.svgIconPath,
                        color: e.selected ||
                                widget.currentIndex == widget.items.indexOf(e)
                            ? e.selectColor
                            : e.unSelectColor,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        e.label,
                        style: TextStyle(
                            color: e.selected ||
                                    widget.currentIndex ==
                                        widget.items.indexOf(e)
                                ? e.selectColor
                                : e.unSelectColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
          ],
        ));
  }
}
