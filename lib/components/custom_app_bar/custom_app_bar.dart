import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/pages/bag.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {required this.title,
      this.leading,
      this.onBadgeTap,
      this.height = 100,
      this.badge = 0,
      this.disableAction = false,
      super.key});

  final String title;
  final int badge;
  final double height;
  final Widget? leading;
  final bool disableAction;
  final VoidCallback? onBadgeTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: leading,
      centerTitle: true,
      toolbarHeight: height,
      actions: disableAction
          ? null
          : [
              GestureDetector(
                onTap: onBadgeTap ??
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const BagPage())));
                    },
                child: Container(
                  height: 40,
                  // width: 70,
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
                  decoration: const BoxDecoration(
                    color: primary,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        bottomLeft: Radius.circular(26)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/icons/cart_icon.svg"),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        badge.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              )
            ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
