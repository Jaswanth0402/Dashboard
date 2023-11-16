import 'package:dashboard_task/core/constants/string.dart';
import 'package:dashboard_task/core/utils/validation.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_extensions
extension keyboardType on String{
  TextInputType get getTextInput {
    switch (this) {
      
      case Strings.name:
        return TextInputType.text;
      case Strings.email:
        return TextInputType.emailAddress;
      case Strings.mobile:
        return TextInputType.phone;
      case Strings.password:
        return TextInputType.visiblePassword;
    }
    return TextInputType.text;
  }

  String? getValidation(String? type) {
    switch (this) {
      case Strings.name:
        return GeneralValidation.isValidElement(type);
      case Strings.email:
        return GeneralValidation.isValidEmailId(type);
      case Strings.mobile:
        return GeneralValidation.isValidElement(type);
      case Strings.password:
        return GeneralValidation.isValidPasswordString(type);
    }
    return null;
  }
}