import 'package:taski/core/widgets/menu_header.dart';
import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/core/widgets/logo.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _profile(),
    );
  }

  Widget _profile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Logo(),
        _nameAndPhoto(),
      ],
    );
  }

  Widget _nameAndPhoto() {
    return MenuHeader(
      attachedWidget: Row(
        spacing: 16,
        children: [
          Text(
            // TODO: Change to user name
            'André',
            style: GoogleFonts.urbanist(
              color: TaskiColors.statePurple,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          ClipOval(
            child: Image.asset(
              TaskiAssets.imageProfile,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
