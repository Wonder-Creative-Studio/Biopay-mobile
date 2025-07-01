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
  final Icon? icon;
  final bool isPrefixIcon;

  const CustomFilledButton({
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
    this.gradient,
    this.icon,
    this.isPrefixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      width: width ?? (isExpanded ? double.infinity : null),
      height: height ?? 50,
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
                    if (isPrefixIcon && icon != null) icon!,
                    if (isPrefixIcon && icon != null) const SizedBox(width: 8),
                    Text.rich(
                      TextSpan(
                        text: subtitle ?? "",
                        style: TextStyle(
                          fontSize: 15,
                          color: subtitleTextColor,
                        ),
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
                    if (!isPrefixIcon && icon != null) const SizedBox(width: 8),
                    if (!isPrefixIcon && icon != null) icon!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
