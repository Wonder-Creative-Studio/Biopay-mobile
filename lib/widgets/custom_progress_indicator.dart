import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double progress;
  final double height;
  final Color? progressColor;
  final Color? backgroundColor;

  const CustomProgressIndicator({
    super.key,
    required this.progress,
    this.height = 12,
    this.progressColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: SizeUtils.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(127),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: LinearProgressIndicator(
              minHeight: 2,
              value: progress,
              backgroundColor: backgroundColor ?? Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(
                progressColor ?? Theme.of(context).primaryColor,
              ),
            ),
          ),
          Positioned(
            right:
                progress < 0.4
                    ? SizeUtils.screenWidth * (1 - progress) - 40
                    : progress < 0.6
                    ? SizeUtils.screenWidth * (1 - progress) - 20
                    : SizeUtils.screenWidth * (1 - progress) - 10,
            top: -2,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: progressColor ?? Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
