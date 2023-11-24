import 'package:flutter/material.dart';
import 'package:rivo_app/core/constant/info_widget.dart';

import '../constant/images.dart';

class BackGroundAuthScreen extends StatelessWidget {
  const BackGroundAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceType) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.bgWhiteTop,
                height: deviceType.localHeight! / 2.3,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                AppImages.bgWhiteDown,
                height: deviceType.localHeight! / 2.3,
              )
            ],
          ),
        ],
      );
    });
  }
}
