import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/features/home/data/models/restaurant_model.dart';

abstract class HomeRepository {
  DataResponse<RestaurantModel> subscribedRestaurant(QueryParams params);
}
