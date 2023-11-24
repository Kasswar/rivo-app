import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/core/unified_api/handling_exception_manager.dart';
import 'package:rivo_app/features/home/data/models/restaurant_model.dart';
import 'package:rivo_app/features/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:rivo_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImplement
    with HandlingExceptionManager
    implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource = HomeRemoteDataSource();
  @override
  DataResponse<RestaurantModel> subscribedRestaurant(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _homeRemoteDataSource.subscribedRestaurant(params);
      return result;
    });
  }
}
