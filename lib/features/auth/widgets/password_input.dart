import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.passwordController,
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
      style: GoogleFonts.urbanist(
        color: TaskiColors.statePurple,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: passwordController.text.isNotEmpty,
          child: IconButton(
            onPressed: showPassword,
            icon: Icon(
              obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: _inputBorderColor(),
            ),
          ),
        ),
        prefixIcon: Icon(
          color: _inputBorderColor(),
          Icons.lock_outline_rounded,
        ),
        labelStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.normal,
          color: TaskiColors.mutedAzure,
          fontSize: 16,
        ),
        labelText: labelText,
        floatingLabelStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.normal,
          color: _inputBorderColor(),
          fontSize: 16,
        ),
        enabledBorder: activeBorder(_inputBorderColor()),
        focusedBorder: activeBorder(_inputBorderColor()),
        focusedErrorBorder: noBorder(),
        disabledBorder: noBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: TaskiColors.redShade,
            width: 2,
          ),
        ),
        border: noBorder(),
      ),
    );
  }

  Color _inputBorderColor() {
    if (focusNode.hasFocus) {
      return TaskiColors.blue;
    } else {
      return TaskiColors.mutedAzure;
    }
  }
}
