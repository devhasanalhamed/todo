import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/global/theme/app_colors/app_colors_light.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      color: const Color.fromARGB(0, 0, 0, 0),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          iconColor: const Color(0xFFFEFEFE),
          prefixIconColor: const Color(0xFFFEFEFE),
          hoverColor: const Color(0xFFFEFEFE),
          fillColor: const Color(0xFFFEFEFE),
          focusColor: const Color(0xFFFEFEFE),
          suffixIconColor: const Color(0xFFFEFEFE),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Color(0xFFFEFEFE),
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Color(0xFFFEFEFE),
              width: 1.0,
            ),
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: 'search'.tr(),
          hintStyle: const TextStyle(color: Color(0xFFFEFEFE)),
        ),
        cursorColor: const Color(0xFFFEFEFE),
      ),
    );
  }
}
