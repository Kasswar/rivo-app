import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/core/usecase/usecase.dart';
import 'package:rivo_app/features/home/data/models/restaurant_model.dart';
import 'package:rivo_app/features/home/domain/repository/home_repository.dart';

class SubscribedRestaurantUsecase
    extends Usecase<RestaurantModel, SubscribedRestaurantParams> {
  final HomeRepository homeRepository;

  SubscribedRestaurantUsecase({required this.homeRepository});
  @override
  DataResponse<RestaurantModel> call(SubscribedRestaurantParams params) {
    return homeRepository.subscribedRestaurant(params.getParams());
  }
}

class SubscribedRestaurantParams with Params {
  final String perPage;
  final String page;

  SubscribedRestaurantParams({required this.perPage, required this.page});

  @override
  QueryParams getParams() => {'perPage': perPage, 'page': page};
}
