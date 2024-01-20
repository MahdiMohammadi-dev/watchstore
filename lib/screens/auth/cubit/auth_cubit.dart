import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/api_links.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Dio httpClient;
  AuthCubit(this.httpClient) : super(AuthInitial()) {
    emit(AuthLoggedOutState());
  }

  sendSms(String mobileNumber) async {
    emit(AuthLoadingState());
    try {
      if (mobileNumber.isEmpty) {
        emit(AuthErrorState(AppException(
          message: "شماره تلفن نمیتواند خالی باشد",
        )));
      } else {
        final response = await httpClient.post(ApisLink.sendSmsApi, data: {
          "mobile": mobileNumber,
        }).then((value) {
          debugPrint(value.data.toString());
          if (value.statusCode == 201) {
            emit(AuthVerifyState());
          } else {
            emit(AuthErrorState(AppException()));
          }
        });
      }
    } catch (e) {
      emit(AuthErrorState(AppException()));
    }
  }

  verifyCode(String mobileNumber, String code) async {
    emit(AuthLoadingState());
    try {
      if (code.isEmpty) {
        emit(AuthErrorState(AppException(
          message: " کد تایید نمیتواند خالی باشد",
        )));
      } else {
        final response = await httpClient.post(ApisLink.checkSmsApi, data: {
          "mobile": mobileNumber,
          "code": code,
        }).then((value) {
          debugPrint(value.data.toString());
          if (value.statusCode == 201) {
            emit(AuthSuccessState());
          } else {
            emit(AuthErrorState(AppException()));
          }
        });
      }
    } catch (e) {
      emit(AuthErrorState(AppException()));
    }
  }
}
