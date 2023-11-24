import 'package:rivo_app/features/home/data/models/restaurant_model.dart';

List<RestaurantModel> getRestaurantList(dynamic data) {
  List<RestaurantModel> restaurantList = [];
  for (var restaurant in data["data"]["subscribed_resturants"]) {
    restaurantList.add(RestaurantModel.fromJson(restaurant));
  }
  return restaurantList;
}
