part of 'g_bloc.dart';

sealed class GState extends Equatable {
  const GState();
  
  @override
  List<Object> get props => [];
}

final class GInitial extends GState {}
