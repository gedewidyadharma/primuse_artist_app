import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/core.dart';

class TextFieldBorderRounded extends StatelessWidget {
  final TextEditingController textController;
  final ValueChanged<String>? onChanged;
  final String? label;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldBorderRounded({
    super.key,
    required this.textController,
    this.onChanged,
    this.label,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText = false,
    this.enabled = true,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    var borderStyle = const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.blackPrimary,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return TextFormField(
      controller: textController,
      onChanged: (value) => onChanged != null ? onChanged!(value) : null,
      keyboardType: textInputType,
      obscureText: obscureText!,
      maxLines: maxLines,
      validator: validator,
      enabled: enabled,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        labelStyle: const TextStyle(fontSize: 12, color: Colors.black54),
        hintStyle: const TextStyle(fontSize: 12, color: Colors.black26),
        border: borderStyle,
        enabledBorder: borderStyle,
        disabledBorder: borderStyle,
        focusedBorder: borderStyle,
        errorBorder: borderStyle,
        focusedErrorBorder: borderStyle,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
