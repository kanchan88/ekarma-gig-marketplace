import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'back_button.dart';
import '../utils/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;
  final bool bottomBorder;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackButtonPressed,
    this.bottomBorder = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final border = BorderSide(width: 1, color: Colors.black.withOpacity(0.2));
    return AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgBackButton(
            onTap: onBackButtonPressed,
            svgImage: SvgPicture.asset(
              backButton,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black, fontSize: 20),
        ),
        bottom: bottomBorder
            ? PreferredSize(
                preferredSize: Size.fromHeight(20.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1, color: Colors.black.withOpacity(0.2)),
                      ),
                    ),
                  ),
                ),
              )
            : null);
  }
}
