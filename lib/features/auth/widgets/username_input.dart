import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    super.key,
    required this.usernameController,
    this.isInErrorState = false,
    required this.focusNode,
    this.onInputClear,
    this.validator,
    this.onChanged,
  });

  final TextEditingController usernameController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onInputClear;
  final bool isInErrorState;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
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
          visible: usernameController.text.isNotEmpty,
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
        labelText: AppLocalizations.of(context)!.username,
        disabledBorder: noBorder(),
        errorBorder: errorBorder(),
        border: noBorder(),
      ),
    );
  }
}
