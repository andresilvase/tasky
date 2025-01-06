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
    return TextFormField(
      controller: passwordController,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      style: inputTextHelperTextStyle(TaskiColors.statePurple),
      cursorErrorColor: TaskiColors.redShade,
      cursorColor: TaskiColors.mutedAzure,
      decoration: InputDecoration(
        errorStyle: inputTextHelperTextStyle(
          TaskiColors.fireRed,
          fontSize: 12,
        ),
        suffixIcon: Visibility(
          visible: passwordController.text.isNotEmpty,
          child: IconButton(
            onPressed: showPassword,
            icon: Icon(
              obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: inputBorderColor(isInErrorState, focusNode.hasFocus),
            ),
          ),
        ),
        prefixIcon: Icon(
          color: inputBorderColor(isInErrorState, focusNode.hasFocus),
          Icons.lock_outline_rounded,
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
