part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final AppException appException;

  const ProfileError({required this.appException});

  @override
  List<Object> get props => [appException];
}

class ProfileSucceed extends ProfileState {
  final UserInfoModelTotal userInfo;
  const ProfileSucceed({required this.userInfo});

  @override
  // TODO: implement props
  List<Object> get props => [userInfo];
}
