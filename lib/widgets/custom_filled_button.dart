import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String? subtitle;
  final Color? titleColor;
  final Color? backgroundColor;
  final double bottomMargin;
  final bool bottomSafeArea;
  final bool isExpanded;
  final double borderRadius;
  final double? width;
  final double? height;
  final Color? subtitleTextColor;
  final TextStyle? titleStyle;
  final Gradient? gradient;

  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.subtitle,
    this.titleColor,
    this.backgroundColor,
    this.bottomMargin = 0,
    this.bottomSafeArea = true,
    this.isExpanded = false,
    this.borderRadius = 3,
    this.width,
    this.height,
    this.subtitleTextColor,
    this.titleStyle,
    this.gradient, // Add gradient parameter for gradient background
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      width: width ?? double.infinity,
      height: height,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: onPressed == null ? Colors.grey.shade300 : backgroundColor,
              foregroundColor: onPressed == null ? Colors.black : titleColor,
              minimumSize: Size(width ?? double.infinity, height ?? 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: FittedBox(
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: subtitle ?? "",
                    style: TextStyle(fontSize: 15, color: subtitleTextColor),
                    children: [
                      TextSpan(
                        text: title,
                        style: titleStyle ?? TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
