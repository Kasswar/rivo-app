import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rivo_app/core/constant/info_widget.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/images.dart';

class CustomBodySplashScreen extends StatelessWidget {
  const CustomBodySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceType) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.logoGreen,
            fit: BoxFit.fill,
            height: deviceType.localHeight! / 5,
          ),
          const Text(
            "Rivo App",
            style: TextStyle(
                fontFamily: "ArbFONTS-Almarai",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.secoundColortow),
          ),
        ],
      );
    });
  }
}
