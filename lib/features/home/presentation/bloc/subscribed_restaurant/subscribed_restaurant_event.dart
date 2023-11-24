part of 'subscribed_restaurant_bloc.dart';


sealed class SubscribedRestaurantEvent {

  const SubscribedRestaurantEvent();

}


class GetSubscribedRestaurantEvent extends SubscribedRestaurantEvent {

  final bool isReload;


  GetSubscribedRestaurantEvent({this.isReload = false});

}

