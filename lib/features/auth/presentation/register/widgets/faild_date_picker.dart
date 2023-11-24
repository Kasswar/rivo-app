import 'package:flutter/material.dart';
import 'package:rivo_app/core/constant/colors.dart';

class CustomDatePickerFaild extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  const CustomDatePickerFaild(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.validator,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        readOnly: true,
        onTap: onTap,
        validator: validator,
        cursorColor: AppColors.primaryColorGreen,
        controller: textEditingController,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: "ArbFONTS-Almarai-Bold",
            ),
            fillColor: AppColors.secoundColorOne.withOpacity(0.7),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
