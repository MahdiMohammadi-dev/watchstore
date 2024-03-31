import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/model/user_info_model/user_info_model.dart';
import 'package:watchstore/data/repository/user_info_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IUserInfoRepository userInfoRepository;
  ProfileBloc(this.userInfoRepository) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is UserInfoInit) {
        try {
          emit(ProfileLoading());
          final response = await userInfoRepository.getUserInfo();
          debugPrint("Profile Resposne ${response.userInfo.name}");
          emit(ProfileSucceed(userInfo: response));
        } catch (e) {
          debugPrint("THis IS Profile bloc Error=>$e");
          emit(ProfileError(appException: AppException()));
        }
      }
    });
  }
}
