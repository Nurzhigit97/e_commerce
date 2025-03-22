import 'package:e_commerce/shared/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? bgColor;
  final TextStyle? textStyle;
  final bool? isLoading;
  final double? height;
  final double? width;
  final Color? borderColor;
  final IconData? icon;
  final String? image;
  final IconAlignment? iconAlignment;

  const AppButtonWidget({
    super.key,
    this.onTap,
    required this.title,
    this.bgColor,
    this.textStyle,
    this.isLoading = false,
    this.height,
    this.width,
    this.borderColor,
    this.icon,
    this.iconAlignment,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon:
          icon != null
              ? Icon(icon, color: borderColor ?? AppColors.white, size: 20)
              : (image != null
                  ? Image.asset(image!, width: 20, height: 20)
                  : const SizedBox.shrink()),
      iconAlignment: iconAlignment ?? IconAlignment.start,
      onPressed: isLoading == true ? null : onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor:
            borderColor != null
                ? borderColor!.withAlpha(1)
                : AppColors.primaryAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side:
              borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none,
        ),
        shadowColor:
            borderColor != null ? Colors.transparent : AppColors.greyED,
        minimumSize:
            width != null
                ? Size(width!, height ?? 45)
                : Size.fromHeight(height ?? 45),
        maximumSize:
            width != null
                ? Size(width!, height ?? 45)
                : Size.fromHeight(height ?? 45),
        backgroundColor: bgColor ?? AppColors.primary,
      ),
      label:
          isLoading == true
              ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(color: Colors.white),
              )
              : Text(
                title,
                style:
                    textStyle ??
                    const TextStyle(color: AppColors.white, fontSize: 16),
              ),
    );
  }
}
