import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/models/device_info.dart';

class CustomBottonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final DeviceInfo deviceInfo;
  final String title;

  const CustomBottonAuth(
      {super.key,
      required this.deviceInfo,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: onPressed,
      height: deviceInfo.localHeight! / 12,
      minWidth: deviceInfo.localWidth! / 1.1,
      color: AppColors.primaryColorGreenAcssent,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20,
            fontFamily: "ArbFONTS-Almarai-Bold",
            color: AppColors.secoundColortow),
      ),
    );
  }
}
