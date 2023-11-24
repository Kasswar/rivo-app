import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class CustomTextQuestionAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String textQuestion;
  final String textAuthType;
  const CustomTextQuestionAuth(
      {super.key,
      required this.onPressed,
      required this.textQuestion,
      required this.textAuthType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textQuestion,
          style: const TextStyle(
              fontSize: 12,
              fontFamily: "ArbFONTS-Almarai-Bold",
              color: AppColors.textColorWhite),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textAuthType,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: "ArbFONTS-Almarai-Bold",
                color: AppColors.primaryColorGreen,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
