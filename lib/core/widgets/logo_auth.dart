import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rivo_app/core/constant/info_widget.dart';

import '../constant/colors.dart';
import '../constant/images.dart';

class CustomLogoAuth extends StatelessWidget {
  final String authTypeName;
  const CustomLogoAuth({super.key, required this.authTypeName});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceType) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: deviceType.localHeight! / 3.5,
            width: deviceType.localWidth! / 2.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 45,
                ),
                SvgPicture.asset(
                  AppImages.logoGreen,
                  allowDrawingOutsideViewBox: true,
                  height: deviceType.localHeight! / 11,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Rivo App",
                  style: TextStyle(
                      color: AppColors.primaryColorGreen,
                      fontFamily: "ArbFONTS-Almarai-ExtraBold",
                      fontWeight: FontWeight.bold,
                      fontSize: deviceType.localHeight! * 0.04),
                ),
                Text(
                  authTypeName,
                  style: TextStyle(
                      color: AppColors.primaryColorGreen,
                      fontFamily: "ArbFONTS-Almarai-ExtraBold",
                      fontWeight: FontWeight.bold,
                      fontSize: deviceType.localHeight! * 0.025),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
