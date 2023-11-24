part of 'subscribed_restaurant_bloc.dart';


enum RestaurantSubscribedStatus { initial, failer, loading, success }


class SubscribedRestaurantState {

  final bool isEndPage;


  final List<SubscribedResturant> restaurantSubscribedList;


  final RestaurantSubscribedStatus restaurantSubscribedStatus;


  final String errorMsg;


  SubscribedRestaurantState({

    this.isEndPage = false,

    this.restaurantSubscribedList = const [],

    this.restaurantSubscribedStatus = RestaurantSubscribedStatus.initial,

    this.errorMsg = "",

  });


  SubscribedRestaurantState copyWith({

    bool? isEndPage,

    List<SubscribedResturant>? restaurantSubscribedList,

    RestaurantSubscribedStatus? restaurantSubscribedStatus,

    String? errorMsg,

  }) {

    return SubscribedRestaurantState(

      isEndPage: isEndPage ?? this.isEndPage,

      restaurantSubscribedList:

          restaurantSubscribedList ?? this.restaurantSubscribedList,

      restaurantSubscribedStatus:

          restaurantSubscribedStatus ?? this.restaurantSubscribedStatus,

      errorMsg: errorMsg ?? this.errorMsg,

    );

  }

}

