import 'package:flutter/material.dart';
import 'package:shopverse/core/theme/colors.dart';

class ReseteButton extends StatelessWidget {
  final VoidCallback? onPressed; // خليها nullable عشان نقدر نعمل disable
  final Widget? icon;
  final String label;
  final bool withBorder;
  final double horizontalPadding;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final bool isLoading;

  const ReseteButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.label,
    this.withBorder = false,
    this.horizontalPadding = 16,
    this.color = ColorsManager.buttonColor,
    this.textColor = ColorsManager.whiteColor,
    this.borderColor = ColorsManager.blackColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.3,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : icon ?? const SizedBox.shrink(),
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 56),
          backgroundColor: color,
          foregroundColor: textColor,
          disabledBackgroundColor: color.withOpacity(0.6),
          disabledForegroundColor: textColor.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(65),
            side: withBorder
                ? BorderSide(
                    color: borderColor,
                    width: 1,
                  )
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
