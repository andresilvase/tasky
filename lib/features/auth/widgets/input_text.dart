import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    this.isInErrorState = false,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.onInputClear,
    this.validator,
    this.onChanged,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onInputClear;
  final bool isInErrorState;
  final FocusNode focusNode;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      focusNode: focusNode,
      onChanged: onChanged,
      style: inputTextHelperTextStyle(TaskiColors.statePurple),
      cursorErrorColor: TaskiColors.redShade,
      cursorColor: TaskiColors.mutedAzure,
      validator: validator,
      decoration: InputDecoration(
        errorStyle: inputTextHelperTextStyle(
          TaskiColors.fireRed,
          fontSize: 12,
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: 42, maxWidth: 42),
        suffixIcon: suffixIcon(
          visible: controller.text.isNotEmpty,
          onPressed: onInputClear,
        ),
        prefixIcon: Icon(
          color: inputBorderColor(isInErrorState, focusNode.hasFocus),
          Icons.person_3_outlined,
        ),
        floatingLabelStyle: inputTextHelperTextStyle(inputBorderColor(isInErrorState, focusNode.hasFocus)),
        labelStyle: inputTextHelperTextStyle(inputBorderColor(isInErrorState, focusNode.hasFocus)),
        focusedErrorBorder: activeBorder(inputBorderColor(isInErrorState, focusNode.hasFocus)),
        enabledBorder: activeBorder(inputBorderColor(isInErrorState, focusNode.hasFocus)),
        focusedBorder: activeBorder(inputBorderColor(isInErrorState, focusNode.hasFocus)),
        disabledBorder: noBorder(),
        errorBorder: errorBorder(),
        labelText: labelText,
        border: noBorder(),
      ),
    );
  }
}
