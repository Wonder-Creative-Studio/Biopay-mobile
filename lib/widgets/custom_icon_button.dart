import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Icon? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? marginTop;
  final double? marginLeft;
  final double? marginBottom;
  final double? height;
  final double? width;
  final double? iconSize;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.marginTop,
    this.marginLeft,
    this.marginBottom,
    this.height,
    this.width,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width ?? 40,
      margin: EdgeInsets.only(
        left: marginLeft ?? 20,
        top: marginTop ?? 10,
        bottom: marginBottom ?? 10,
      ),
      child: IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          minimumSize: const Size(20, 20),
        ),
        icon: icon ?? Icon(Icons.arrow_back),
        color: iconColor ?? Colors.white,
        iconSize: iconSize ?? 20.0,
      ),
    );
  }
}
