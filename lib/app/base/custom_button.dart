import 'package:flutter/material.dart';
import '../util/app_colors.dart';
import '../util/dimensions.dart';

class CustomButton extends StatelessWidget {
  final double buttonWidth;
  final String buttonName;
  final double fontSize;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.buttonWidth,
    required this.buttonName,
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
