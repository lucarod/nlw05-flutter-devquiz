import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dev_quiz/core/app_colors.dart';

class NextButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  final String label;

  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.skip({required this.label, required this.onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.lightGrey,
        this.borderColor = AppColors.border;

  NextButtonWidget.confirm({required this.label, required this.onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
