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
  final Icon? icon;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.subtitle,
    this.titleColor,
    this.backgroundColor,
    this.bottomMargin = 0,
    this.bottomSafeArea = true,
    this.isExpanded = true,
    this.borderRadius = 15,
    this.width,
    this.height,
    this.subtitleTextColor,
    this.titleStyle,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      width: width ?? (isExpanded ? double.infinity : null),
      height: height ?? 50,
      child: Center(
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor:
                onPressed == null ? Colors.grey.shade300 : backgroundColor,
            foregroundColor: onPressed == null ? Colors.black : titleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            minimumSize: Size(
              width ?? (isExpanded ? double.infinity : 150),
              height ?? 50,
            ),
          ),
          child: FittedBox(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
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
                  if (icon != null) const SizedBox(width: 8),
                  if (icon != null) icon!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
