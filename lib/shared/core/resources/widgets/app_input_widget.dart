import 'package:e_commerce/shared/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppInputWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? title;
  final String? titleIcon;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final VoidCallback? onFieldSaved;
  final void Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final Color? filledColor;
  final Color? titleColor;
  final Color? hintColor;
  final int? maxLength;
  final FocusNode? focusNode;
  final double? height;
  final int? maxLines;
  final double? borderRadius;
  final Widget? leading;
  final bool? isReadOnly;
  final double? sizeboxHeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderSide? borderWidth;
  final Color? borderColor;
  final String? initialValue;
  final bool? isFocus;
  final TextCapitalization? textCapitalization;
  final List<String>? autofillHints;

  const AppInputWidget({
    super.key,
    this.hintText,
    this.controller,
    this.isPasswordField,
    this.validator,
    this.inputType,
    this.textCapitalization,
    this.title,
    this.titleIcon,
    this.onTap,
    this.autofillHints,
    this.onChanged,
    this.onEditingComplete,
    this.filledColor = AppColors.hintBackColor,
    this.titleColor = AppColors.black,
    this.maxLines = 1,
    this.leading,
    this.isReadOnly = false,
    this.sizeboxHeight,
    this.prefixIcon,
    this.borderRadius,
    this.hintColor,
    this.focusNode,
    this.maxLength,
    this.height,
    this.onFieldSaved,
    this.suffixIcon,
    this.borderWidth,
    this.borderColor,
    this.initialValue = '',
    this.isFocus,
  });

  @override
  State<AppInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<AppInputWidget> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.sizeboxHeight ?? 16),
        if (widget.title != null)
          Row(
            children: [
              if (widget.titleIcon != null) ...[
                Image.asset(widget.titleIcon!, height: 40, width: 40),
                const SizedBox(width: 13),
              ],
              Text(
                widget.title!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: widget.titleColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        Padding(
          padding: EdgeInsets.only(top: widget.sizeboxHeight ?? 6),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            obscureText: widget.isPasswordField == true ? _obsecureText : false,
            cursorColor: AppColors.black1,
            onTap: widget.onTap,
            readOnly: widget.isReadOnly ?? false,
            style: Theme.of(context).textTheme.bodyMedium,
            autofillHints:
                widget.autofillHints
                    ?.map((hint) => AutofillHints.name)
                    .toList(),
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.sentences,
            validator: widget.validator,
            textInputAction:
                widget.inputType == TextInputType.number
                    ? TextInputAction.done
                    : TextInputAction.next,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              enabled: true,
              prefixIcon: widget.prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.transparent,
                  width: widget.borderWidth?.width ?? 1.0,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              focusedBorder:
                  widget.isFocus == true
                      ? OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: widget.borderWidth?.width ?? 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 10,
                        ),
                      )
                      : OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.borderColor ?? AppColors.transparent,
                          width: widget.borderWidth?.width ?? 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 10,
                        ),
                      ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 10),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 10),
                ),
              ),
              filled: true,
              fillColor: widget.filledColor,
              errorMaxLines: 3,
              hintText: widget.hintText,
              prefixIconConstraints: const BoxConstraints(minWidth: 50),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: widget.hintColor ?? AppColors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              suffixIconConstraints: const BoxConstraints(minWidth: 50 - 20.0),
              suffixIconColor: AppColors.black2,
              suffixIcon:
                  widget.suffixIcon ??
                  (widget.isPasswordField == true
                      ? GestureDetector(
                        onTap: () {
                          setState(() => _obsecureText = !_obsecureText);
                        },
                        child: Icon(
                          _obsecureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.black2,
                        ),
                      )
                      : null),
            ),
          ),
        ),
      ],
    );
  }
}
