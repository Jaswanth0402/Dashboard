import 'dart:js';
import 'package:flutter/material.dart';


import '../../../core/utils/colors.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.05,
      child: TextField(
        cursorColor: darkBlack,
        decoration: InputDecoration(
          fillColor:white,
          filled: true,
          contentPadding: EdgeInsets.zero,
          prefixIcon: const Icon(Icons.search, size: 18.0, color: darkGrey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:darkGrey),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: darkGrey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: darkGrey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: darkGrey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: lightBlack, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black26, fontSize: 14.0),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}