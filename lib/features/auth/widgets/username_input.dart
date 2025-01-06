import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    super.key,
    required this.usernameController,
    this.onInputClear,
    this.validator,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController usernameController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onInputClear;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      focusNode: focusNode,
      onChanged: onChanged,
      style: GoogleFonts.urbanist(
        color: TaskiColors.statePurple,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      validator: validator,
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(maxHeight: 36, maxWidth: 36),
        suffixIcon: suffixIcon(
          visible: usernameController.text.isNotEmpty,
          onPressed: onInputClear,
        ),
        prefixIcon: Icon(
          color: inputBorderColor(),
          Icons.person_3_outlined,
        ),
        labelStyle: GoogleFonts.urbanist(
          fontWeight: FontWeight.normal,
          color: TaskiColors.mutedAzure,
          fontSize: 16,
        ),
        labelText: AppLocalizations.of(context)!.searchForATask,
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
