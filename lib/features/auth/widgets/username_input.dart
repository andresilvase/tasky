import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    super.key,
    required this.usernameController,
    required this.focusNode,
    this.onInputClear,
    this.validator,
    this.onChanged,
  });

  final TextEditingController usernameController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onInputClear;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      autofocus: true,
      focusNode: focusNode,
      onChanged: onChanged,
      style: GoogleFonts.urbanist(
        color: TaskiColors.statePurple,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      validator: validator,
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(maxHeight: 42, maxWidth: 42),
        suffixIcon: suffixIcon(
          visible: usernameController.text.isNotEmpty,
          onPressed: onInputClear,
        ),
        prefixIcon: Icon(
          color: _inputBorderColor(),
          Icons.person_3_outlined,
        ),
        labelStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.normal,
          color: TaskiColors.mutedAzure,
          fontSize: 16,
        ),
        labelText: AppLocalizations.of(context)!.username,
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
