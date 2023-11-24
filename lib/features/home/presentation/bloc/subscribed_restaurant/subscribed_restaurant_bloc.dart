import 'dart:async';


import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


import 'package:rivo_app/features/home/data/models/restaurant_model.dart';


import 'package:rivo_app/features/home/data/repository_implement/home_repository_implement.dart';


import 'package:rivo_app/features/home/domain/usecases/subscribed_restaurant_usecase.dart';


part 'subscribed_restaurant_event.dart';


part 'subscribed_restaurant_state.dart';


class SubscribedRestaurantBloc

    extends Bloc<SubscribedRestaurantEvent, SubscribedRestaurantState> {

  final int _perPage = 5;


  final _subscribedRestaurantUsecase =

      SubscribedRestaurantUsecase(homeRepository: HomeRepositoryImplement());


  SubscribedRestaurantBloc() : super(SubscribedRestaurantState()) {

    on<GetSubscribedRestaurantEvent>(_mapGetSubscribedRestaurant);

  }


  FutureOr<void> _mapGetSubscribedRestaurant(GetSubscribedRestaurantEvent event,

      Emitter<SubscribedRestaurantState> emit) async {

    if (state.restaurantSubscribedStatus ==

            RestaurantSubscribedStatus.initial &&

        event.isReload) {

      emit(state.copyWith(

          restaurantSubscribedStatus: RestaurantSubscribedStatus.loading));


      final reslut = await _subscribedRestaurantUsecase(

          SubscribedRestaurantParams(perPage: _perPage.toString(), page: '1'));


      reslut.fold(

          (failure) => emit(state.copyWith(

              restaurantSubscribedStatus: RestaurantSubscribedStatus.failer,

              errorMsg: failure.message)), (restaurantModel) {

        emit(state.copyWith(

          isEndPage:

              restaurantModel.data!.subscribedResturants!.length < _perPage,

          restaurantSubscribedList: restaurantModel.data!.subscribedResturants!,

          restaurantSubscribedStatus: RestaurantSubscribedStatus.success,

        ));

      });

    } else if (!state.isEndPage) {

      emit(state.copyWith(

        restaurantSubscribedStatus: RestaurantSubscribedStatus.loading,

      ));


      final result = await _subscribedRestaurantUsecase(

          SubscribedRestaurantParams(
              perPage: _perPage.toString(),
              page: (state.restaurantSubscribedList.length / _perPage + 1)
                  .toString()));


      result.fold(

          (failure) => emit(state.copyWith(

                restaurantSubscribedStatus: RestaurantSubscribedStatus.failer,

                errorMsg: failure.message,

              )), (restaurantModel) {

        emit(state.copyWith(

          restaurantSubscribedStatus: RestaurantSubscribedStatus.success,

          restaurantSubscribedList: List.of(state.restaurantSubscribedList)

            ..addAll(restaurantModel.data!.subscribedResturants!),

          isEndPage:

              restaurantModel.data!.subscribedResturants!.length < _perPage,

        ));

      });

    }

  }

}

