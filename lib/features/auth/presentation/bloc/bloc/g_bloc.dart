import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'g_event.dart';
part 'g_state.dart';

class GBloc extends Bloc<GEvent, GState> {
  GBloc() : super(GInitial()) {
    on<GEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
