import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.passwordController,
    this.isInErrorState = false,
    this.obscureText = true,
    required this.labelText,
    required this.focusNode,
    this.showPassword,
    this.validator,
    this.onChanged,
  });

  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? showPassword;
  final bool isInErrorState;
  final FocusNode focusNode;
  final bool obscureText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final inputColor = inputBorderColor(focusNodeHasFocus: focusNode.hasFocus, isInErrorState: isInErrorState);

    return TextFormField(
      controller: passwordController,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      style: inputTextStyle(inputColor),
      cursorErrorColor: TaskiColors.redShade,
      cursorColor: TaskiColors.mutedAzure,
      decoration: InputDecoration(
        errorStyle: inputTextStyle(
          TaskiColors.fireRed,
          fontSize: 12,
        ),
        suffixIcon: Visibility(
          visible: passwordController.text.isNotEmpty,
          child: IconButton(
            onPressed: showPassword,
            icon: Icon(
              obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: inputColor,
            ),
          ),
        ),
        prefixIcon: Icon(
          color: inputColor,
          Icons.lock_outline_rounded,
        ),
        floatingLabelStyle: inputTextStyle(inputColor),
        focusedErrorBorder: activeBorder(inputColor),
        enabledBorder: activeBorder(inputColor),
        focusedBorder: activeBorder(inputColor),
        labelStyle: inputTextStyle(inputColor),
        disabledBorder: noBorder(),
        errorBorder: errorBorder(),
        labelText: labelText,
        border: noBorder(),
      ),
    );
  }
}
