import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rivo_app/core/constant/colors.dart';
import 'package:rivo_app/core/constant/images.dart';
import 'package:rivo_app/core/constant/info_widget.dart';
import 'package:rivo_app/features/home/presentation/bloc/subscribed_restaurant/subscribed_restaurant_bloc.dart';
import 'package:rivo_app/features/home/presentation/widget/home_search.dart';
import 'package:rivo_app/features/home/presentation/widget/suggested_for_you.dart';
import 'package:rivo_app/features/home/presentation/widget/your_subscriptions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController searchController;
  late SubscribedRestaurantBloc subscribedRestaurantBloc;
  @override
  void initState() {
    searchController = TextEditingController();
    subscribedRestaurantBloc = SubscribedRestaurantBloc();
    subscribedRestaurantBloc.add(GetSubscribedRestaurantEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => subscribedRestaurantBloc,
      child: InfoWidget(builder: (context, deviceInfo) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColorGreenAcssent,
            title: const Text(
              'Rivo',
              style: TextStyle(
                color: AppColors.greyShadeTwo,
                fontFamily: "ArbFONTS-Almarai-ExtraBold",
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: SvgPicture.asset(AppImages.logoWhite),
            actions: [
              Icon(
                Icons.view_headline,
                color: AppColors.greyShadeTwo,
                size: deviceInfo.localHeight! / 20,
              )
            ],
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth! / 20,
                vertical: deviceInfo.localHeight! / 28,
              ),
              child: Column(
                children: [
                  HomeSearch(
                    serachFun: () {},
                    searchController: searchController,
                    deviceInfo: deviceInfo,
                  ),
                  BlocBuilder<SubscribedRestaurantBloc,
                      SubscribedRestaurantState>(
                    builder: (context, state) {
                      if (state.restaurantSubscribedStatus ==
                          RestaurantSubscribedStatus.loading) {
                        // print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
                        // print(state.restaurantSubscribedStatus);
                        return const Text(
                          'Please Wait',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        );
                      }
                      if (state.restaurantSubscribedStatus ==
                          RestaurantSubscribedStatus.failer) {
                        return const Text(
                          'Error',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        );
                      }
                      print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
                      print(state.restaurantSubscribedList);
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
                                itemCount:
                                    state.restaurantSubscribedList.length +
                                        (state.isEndPage ? 0 : 1),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: deviceInfo.localWidth! / 45,
                                ),
                                itemBuilder: (context, index) {
                                  if (state.restaurantSubscribedList.length ==
                                      index) {
                                    subscribedRestaurantBloc
                                        .add(GetSubscribedRestaurantEvent());
                                    return const Text(
                                      'Please Wait',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    );
                                  }
                                  return Container(
                                    width: deviceInfo.localWidth! / 2.2,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColorGreenAcssent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: state.restaurantSubscribedList[index]
                                                .bannerImage !=
                                            null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              state
                                                  .restaurantSubscribedList[
                                                      index]
                                                  .bannerImage!
                                                  .mediaUrl!,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : const Center(
                                            child: Text("No Image"),
                                          ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: deviceInfo.localHeight! / 80,
                  ),
                  SuggestedForYou(
                      deviceInfo: deviceInfo,
                      suggestedList: const [1, 2, 3, 4, 5]),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
