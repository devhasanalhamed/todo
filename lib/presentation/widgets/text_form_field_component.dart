import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final ValueChanged<String>? submit;
  final FormFieldValidator<String>? validator;
  final String label;
  final IconData prefixIcon;
  final String hintText;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final int? maxLines;

  const TextFormFieldComponent({
    super.key,
    required this.controller,
    this.inputType,
    this.submit,
    this.validator,
    required this.label,
    required this.prefixIcon,
    required this.hintText,
    this.onTap,
    this.readOnly = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      maxLines: maxLines,
      controller: controller,
      keyboardType: inputType,
      onTap: onTap,
      validator: validator,
      onFieldSubmitted: submit,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
