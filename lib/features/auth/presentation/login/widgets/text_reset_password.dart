import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class CustomTextResetPassword extends StatelessWidget {
  final void Function()? onPressed;
  const CustomTextResetPassword({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: TextButton(
        onPressed: onPressed,
        child: const Text(
          "نسيت كلمة المرور؟",
          style: TextStyle(
              fontSize: 12,
              fontFamily: "ArbFONTS-Almarai-Bold",
              color: AppColors.primaryColorGreenAcssent),
        ),
      ),
    );
  }
}
