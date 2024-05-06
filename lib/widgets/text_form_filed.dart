import 'package:flutter/material.dart';
import 'package:test_project/core/constants/text_style.dart';



class SearchTextField extends StatelessWidget {
  const SearchTextField({
    this.controller,
    required this.search,
    required this.hintText,
    this.height,
    super.key,
  });
  final TextEditingController? controller;
  final Function(String) search;
  final String hintText;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: search,
        controller: controller,
        style: TextStyles.bodyMedium.copyWith(
          color: Theme.of(context).textTheme.displayMedium!.color,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
              // width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            size: height != null ? 20 : null,
          ),
          hintText: hintText,
          hintStyle: TextStyles.bodyMedium.copyWith(
            color: Theme.of(context).textTheme.displayMedium!.color,
          ),
        ),
      ),
    );
  }

}
