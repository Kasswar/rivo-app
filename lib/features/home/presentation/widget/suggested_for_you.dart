import 'package:flutter/material.dart';
import 'package:rivo_app/core/constant/colors.dart';
import 'package:rivo_app/core/models/device_info.dart';

class SuggestedForYou extends StatelessWidget {
  final DeviceInfo deviceInfo;
  final List suggestedList;
  const SuggestedForYou(
      {super.key, required this.deviceInfo, required this.suggestedList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceInfo.localHeight! / 1.99,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "مقترح لك",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: suggestedList.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: deviceInfo.localHeight! / 100,
                    crossAxisSpacing: deviceInfo.localWidth! / 50,
                    childAspectRatio: 4 / 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColorGreenAcssent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://library.sportingnews.com/styles/crop_style_16_9_desktop/s3/2023-02/Cristiano_Ronaldo_celebrate_Al-Nassr_Al-Wehda_2023.jpg?h=920929c4&itok=piB9zyV3',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
