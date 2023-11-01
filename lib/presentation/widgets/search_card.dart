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
      color: AppColorsLight.appBarBackgroundColor,
      child: Card(
        margin: EdgeInsets.zero,
        child: TextFormField(
          decoration: const InputDecoration(
            isDense: true,
            iconColor: Color(0xFFFEFEFE),
            prefixIconColor: Color(0xFFFEFEFE),
            hoverColor: Color(0xFFFEFEFE),
            fillColor: Color(0xFFFEFEFE),
            focusColor: Color(0xFFFEFEFE),
            suffixIconColor: Color(0xFFFEFEFE),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: Color(0xFFFEFEFE),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: Color(0xFFFEFEFE),
                width: 1.0,
              ),
            ),
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            hintStyle: TextStyle(color: Color(0xFFFEFEFE)),
          ),
          cursorColor: const Color(0xFFFEFEFE),
        ),
      ),
    );
  }
}
