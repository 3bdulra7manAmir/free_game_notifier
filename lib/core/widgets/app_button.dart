import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/themes/color_system/color_switcher.dart';
import '../constants/app_borders.dart';
import '../constants/app_borders_styles.dart';
import '../constants/app_styles.dart';

class CustomButton extends ConsumerWidget
{
  const CustomButton({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonBorderRadius,
    this.buttonBorderColor,
    this.buttonBorderWidth,
    this.buttonBackgroundColor,
    required this.buttonText,
    this.buttonTextStyle,
    required this.buttonOnPressed,
    this.buttonPadding,
  });

  final double? buttonWidth;
  final double? buttonHeight;
  final EdgeInsetsGeometry? buttonPadding;
  final BorderRadiusGeometry? buttonBorderRadius;
  final Color? buttonBorderColor;
  final double? buttonBorderWidth;
  final Color? buttonBackgroundColor;
  final void Function() buttonOnPressed;
  final String buttonText;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 48.h,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(buttonPadding),
          backgroundColor: WidgetStateProperty.all<Color>(buttonBackgroundColor!), //HERE
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: buttonBorderRadius ?? AppBordersRadiuses.circular.large,
              side: BorderSide(color: buttonBorderColor ?? AppColors.color.kTransparent, width: buttonBorderWidth ?? AppBorderWidths.xsmall))),
        ),
        onPressed: buttonOnPressed,
        child: Text(buttonText, style: buttonTextStyle ?? AppFontStyles.textStyle14(fontColor: AppColors.color.kWhite002,),),
      ),
    );
  }
}
