import 'package:rivo_app/core/config/typedef.dart';

import 'package:rivo_app/core/unified_api/api_variables.dart';
import 'package:rivo_app/core/unified_api/get_api.dart';
import 'package:rivo_app/features/home/data/models/restaurant_model.dart';

class HomeRemoteDataSource {
  Future<RestaurantModel> subscribedRestaurant(QueryParams params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.subscribedRestaurant(params: params),
      fromJson: restaurantModelFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
