import 'package:flutter/material.dart';
import '../util/app_colors.dart';
import '../util/styles.dart';

final textInputDecoration = InputDecoration(
  labelStyle: robotoMedium.copyWith(
    color: AppColors.lightGreyColor,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor.withOpacity(0.4),
      width: 1,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor.withOpacity(0.4),
      width: 1,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.redColor.withOpacity(0.5),
      width: 1,
    ),
  ),
);
