import 'package:flutter/material.dart';
import 'package:rivo_app/core/constant/colors.dart';
import 'package:rivo_app/core/models/device_info.dart';
import 'package:rivo_app/features/home/data/models/restaurant_model.dart';

class YourSubscriptions extends StatelessWidget {
  final List<SubscribedResturant> subscriptionsList;
  final bool isEndPage;
  final DeviceInfo deviceInfo;
  const YourSubscriptions(
      {super.key,
      required this.subscriptionsList,
      required this.isEndPage,
      required this.deviceInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceInfo.localHeight! / 6.2,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "اشتراكاتك",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            //height: 90,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: subscriptionsList.length + (isEndPage ? 0 : 1),
              separatorBuilder: (context, index) => SizedBox(
                width: deviceInfo.localWidth! / 45,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: deviceInfo.localWidth! / 2.2,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColorGreenAcssent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      subscriptionsList[index].bannerImage!.mediaUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
