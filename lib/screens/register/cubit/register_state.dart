part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegsiterError extends RegisterState {
  final AppException exception;

  RegsiterError({required this.exception});
}

class LocationPickedState extends RegisterState {
  final String? location;
  final GeoPoint? latlng;

  LocationPickedState(this.latlng, {required this.location});
}
