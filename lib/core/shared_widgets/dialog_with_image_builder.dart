import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dialog_content.dart';

FutureOr<void> dialogWithImageBuilder(
    {required BuildContext context,
    required String image,
    required String successText,
    required String buttonText,
    VoidCallback? onPressed,
    Widget? textWidget,
    bool showButtonInside = false,
    int? popBackLevel}) {
  return showGeneralDialog(
    barrierDismissible: false,
    barrierLabel: '',
    barrierColor: Color(0x00ffffff),
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => Dialog.fullscreen(
        backgroundColor: Color(0x00ffffff),
        child: DialogContent(
            onPressed: onPressed,
            image: image,
            textWidget: textWidget,
            showButtonInside: showButtonInside,
            successText: successText,
            buttonText: buttonText,
            popBackLevel: popBackLevel)),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
      child: FadeTransition(
        child: child,
        opacity: anim1,
      ),
    ),
    context: context,
  );
}
