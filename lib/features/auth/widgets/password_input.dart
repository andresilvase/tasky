import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.usernameController,
    this.obscureText = true,
    required this.labelText,
    this.showPassword,
    this.validator,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController usernameController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? showPassword;
  final FocusNode? focusNode;
  final bool obscureText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
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
        // suffixIconConstraints: BoxConstraints(maxHeight: 36, maxWidth: 36),
        suffixIcon: IconButton(
          onPressed: showPassword,
          icon: Icon(
            obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: TaskiColors.mutedAzure,
          ),
        ),
        prefixIcon: Icon(
          color: inputBorderColor(),
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
          color: inputBorderColor(),
          fontSize: 16,
        ),
        enabledBorder: activeBorder(inputBorderColor()),
        focusedBorder: activeBorder(inputBorderColor()),
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

  Color inputBorderColor() {
    if (focusNode?.hasFocus ?? false) {
      return TaskiColors.blue;
    } else {
      return TaskiColors.mutedAzure;
    }
  }
}
