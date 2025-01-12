import 'package:tasky/core/widgets/text_field_common_widgets.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    this.isInErrorState = false,
    required this.controller,
    required this.isDarkMode,
    required this.focusNode,
    required this.labelText,
    this.onInputClear,
    this.prefixWidget,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.maxLines,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onInputClear;
  final Widget? prefixWidget;
  final IconData? prefixIcon;
  final bool isInErrorState;
  final FocusNode focusNode;
  final String labelText;
  final bool isDarkMode;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final inputColor = inputBorderColor(focusNodeHasFocus: focusNode.hasFocus, isInErrorState: isInErrorState);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      style: inputTextStyle(isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple),
      cursorErrorColor: TaskiColors.redShade,
      cursorColor: TaskiColors.mutedAzure,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorStyle: inputTextStyle(
          TaskiColors.fireRed,
          fontSize: 12,
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: 42, maxWidth: 42),
        suffixIcon: suffixIcon(
          visible: controller.text.isNotEmpty,
          onPressed: onInputClear,
        ),
        prefixIcon: prefixWidget ?? Icon(prefixIcon ?? Icons.person_3_outlined, color: inputColor),
        floatingLabelStyle: inputTextStyle(inputColor),
        focusedErrorBorder: activeBorder(inputColor),
        focusedBorder: activeBorder(inputColor),
        enabledBorder: activeBorder(inputColor),
        labelStyle: inputTextStyle(inputColor),
        disabledBorder: noBorder(),
        errorBorder: errorBorder(),
        labelText: labelText,
        border: noBorder(),
      ),
    );
  }
}
