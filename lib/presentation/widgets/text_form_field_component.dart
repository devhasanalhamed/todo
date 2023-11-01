import 'package:flutter/material.dart';

Widget textFormFieldComponent({
  required TextEditingController controller,
  required TextInputType inputType,
  required ValueChanged<String>? submit,
  required FormFieldValidator<String>? validator,
  required String label,
  required IconData prefixIcon,
  required String hintText,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
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
