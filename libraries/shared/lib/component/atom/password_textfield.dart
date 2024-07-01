import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared/shared.dart';

import 'atom.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.onChange,
      this.errorText,
      this.textInputAction})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final dynamic Function(String?)? onChange;
  final String? errorText;
  final TextInputAction? textInputAction;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: isObscureText,
      decoration: AppInputDecoration(
        hintText: widget.hintText,
      ),
      onChange: widget.onChange,
      suffixWidget: _visibilityIcon(context),
      prefixWidget: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(MainAssets.lock),
      ),
      errorText: widget.errorText,
    );
  }

  Widget _visibilityIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => isObscureText = !isObscureText);
      },
      icon: Icon(
        _visibilityIconData,
        color: Colors.grey,
      ),
    );
  }

  IconData get _visibilityIconData {
    return isObscureText ? Icons.visibility : Icons.visibility_off;
  }
}
