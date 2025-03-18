import 'package:flutter/material.dart';
import 'package:librotech/src/features/app/widgets/custom_text.dart';
import 'package:librotech/src/features/app/widgets/custom_text_field.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? sufixIcon;
  final double? width;
  final double? height;
  final Color borderColor;
  final bool obscureText;
  final String title;
  final double? fontSizeTitle;
  final Color? colorTitle;
  final FontWeight? fontWeightTitle;
  final TextAlign? textAlignTitle;
  final TextInputType? keyBoardType;
  final int? maxLength;
  final Function(String) onChanged;
  final String? Function(String?) validator;

  const CustomTextFieldWithTitle({
    super.key,
    required this.controller,
    required this.hint,
    this.sufixIcon,
    this.width,
    this.height,
    required this.borderColor,
    required this.obscureText,
    required this.title,
    this.fontSizeTitle,
    this.colorTitle,
    this.fontWeightTitle,
    this.textAlignTitle,
    this.keyBoardType,
    required this.onChanged,
    required this.validator,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: fontSizeTitle,
          color: colorTitle,
          fontWeight: fontWeightTitle,
          textAlign: textAlignTitle,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          maxLength: maxLength,
          hint: hint,
          sufixIcon: sufixIcon,
          width: width,
          height: maxLength != null ? 65 : 55,
          borderColor: borderColor,
          obscureText: obscureText,
          keyboardType: keyBoardType,
        ),
      ],
    );
  }
}
