import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
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
  const CustomOutlinedButton({
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
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: bottomSafeArea,
      child: Container(
        margin: EdgeInsets.only(bottom: bottomMargin),
        width: width ?? double.infinity,
        height: height,
        child: Center(
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor:
                  onPressed == null ? Colors.grey.shade300 : backgroundColor,
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
                        style:
                            titleStyle ??
                            TextStyle(fontSize: 15, color: Colors.white),
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
