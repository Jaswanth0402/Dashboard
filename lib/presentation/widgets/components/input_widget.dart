import 'package:dashboard_task/core/utils/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';


class InputWidget extends StatelessWidget {
  final TextInputAction? textInputAction;
  final String? editTextType;
  final String? titles;
  final String? hintText;
  final Widget? prefixIcons;
  final TextEditingController? controller;
  final bool secureTxt;
  final bool enabled;
  final bool? autofocus;
  final Widget? suffixIcons;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TapRegionCallback? onTapOutside;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? customValidator;
  final GlobalKey<FormState>? formKey;
  final AutovalidateMode? autoValidateMode;

  const InputWidget({
    Key? key,
    required this.textInputAction,
    required this.editTextType,
    required this.titles,
    required this.prefixIcons,
    this.enabled = true,
    this.onEditingComplete,
    this.customValidator,
    this.focusNode,
    this.autofocus,
    this.onChanged,
    this.onTapOutside,
    this.hintText,
    this.onFieldSubmitted,
    this.secureTxt = false,
    this.suffixIcons,
    this.controller,
    this.formKey,
    this.autoValidateMode,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titles ?? '',
          style: const TextStyle(fontWeight: FontWeight.w100,color: white),
        ),
        const SizedBox(height: 8),
        SizedBox(
          child: Opacity(
            opacity: enabled ? 1.0 : 0.5,
            child: TextFormField(
              key: formKey,
              autofocus: autofocus ?? false,
              enabled: enabled,
              focusNode: focusNode,
              onChanged: onChanged,
              onTapOutside: onTapOutside,
              onEditingComplete: onEditingComplete,
              onFieldSubmitted:onFieldSubmitted,
              obscureText: secureTxt,
              textInputAction: textInputAction,
              style: const TextStyle(color:white),
              controller: controller,
              keyboardType: editTextType?.getTextInput,
              validator: (value) {
                if (customValidator != null) {
                  return customValidator!(value);
                }
                return editTextType!.getValidation(value);
              },
              autovalidateMode: autoValidateMode,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle:const TextStyle(color: white),
                  isDense: true,
                
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color:lightBlueAccent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color:lightBlueAccent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: lightBlueAccent),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color:primaryColor),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: primaryColor),
                  ),
                  errorStyle: const TextStyle(
                    color: primaryColor,
                  ),
                  prefixIcon: prefixIcons,
                  suffixIcon: suffixIcons),
            ),
          ),
        ),
      ],
    );
  }
}