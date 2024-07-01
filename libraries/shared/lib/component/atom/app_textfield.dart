import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.decoration = const AppInputDecoration(),
    this.prefixWidget,
    this.suffixWidget,
    this.obscureText = false,
    this.maxLines = 1,
    this.onTap,
    this.margin,
    this.onSubmit,
    this.onChange,
    this.enabled = true,
    this.validator,
    this.keyboardType,
    this.borderRadius = 10,
    this.errorText = null,
    this.textInputAction,
    this.colorTextField,
    this.maxLengthCharacter,
    this.hintTextColor,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final AppInputDecoration decoration;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;
  final int maxLines;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final Function(String?)? onSubmit;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final String? errorText;
  final Color? colorTextField;
  final int? maxLengthCharacter;
  final Color? hintTextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          color: decoration.fillColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 10,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(maxLengthCharacter ?? -1),
                ],
                textInputAction: textInputAction,
                keyboardType: keyboardType,
                enabled: enabled,
                cursorColor: AppColors.primaryColor,
                // onTap: onTap,
                controller: controller,
                focusNode: focusNode,
                obscureText: obscureText,
                maxLines: maxLines,
                minLines: 1,
                style: decoration.inputStyle ?? Styles.textMRegular,
                validator: validator,
                onChanged: onChange,
                onFieldSubmitted: onSubmit,
                decoration: InputDecoration(
                  hintText: decoration.hintText,
                  hintStyle: decoration.hintStyle ??
                      Styles.textMRegular.copyWith(
                        color: hintTextColor ??
                            Colors.blueGrey.shade500.withOpacity(.5),
                      ),
                  fillColor: enabled == true
                      ? colorTextField ?? Colors.transparent
                      : Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                        color: decoration.removeBorder
                            ? Colors.transparent
                            : Colors.blueGrey.shade700),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                        color: decoration.removeBorder
                            ? Colors.transparent
                            : Colors.blueGrey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                        color: decoration.removeBorder
                            ? Colors.transparent
                            : AppColors.primaryColor.withOpacity(.88),
                        width: 2.5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                        color: decoration.removeBorder
                            ? Colors.transparent
                            : Colors.blueGrey.shade200),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                        color: decoration.removeBorder
                            ? Colors.transparent
                            : Colors.redAccent.shade700),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                        color: decoration.removeBorder
                            ? Colors.transparent
                            : Colors.redAccent.shade200,
                        width: 2.5),
                  ),
                  errorText: errorText,
                  prefixIcon: prefixWidget,
                  suffixIcon: suffixWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppInputDecoration {
  const AppInputDecoration({
    this.hintStyle,
    this.inputStyle,
    this.fillColor,
    this.hintText = '',
    this.radius,
    this.removeBorder = false,
  });

  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final Color? fillColor;
  final String hintText;
  final BorderRadiusGeometry? radius;
  final bool removeBorder;
}
