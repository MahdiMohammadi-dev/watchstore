import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/utils/shared_prefrences_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final Dio httpClient = Dio();

  //* TODO: SendSms Method
  sendSms(String mobileNumber) async {
    emit(AuthLoadingState());
    try {
      if (mobileNumber.isEmpty) {
        emit(AuthErrorState(AppException(
          message: "شماره تلفن نمیتواند خالی باشد",
        )));
      } else {
        final response = await httpClient
            .post(ApisLink.baseUrl + ApisLink.sendSmsApi, data: {
          "mobile": mobileNumber,
        }).then((value) {
          debugPrint(value.data.toString());
          if (value.statusCode == 201) {
            emit(AuthVerifyState(mobileNumber));
          } else {
            emit(AuthErrorState(AppException()));
          }
        });
      }
    } catch (e) {
      emit(AuthErrorState(AppException()));
      debugPrint('Hello${e.toString()}');
    }
  }

  //! Verify Method
  verifyCode(String mobileNumber, String code) async {
    emit(AuthLoadingState());
    try {
      if (code.isEmpty) {
        emit(AuthErrorState(AppException(
          message: " کد تایید نمیتواند خالی باشد",
        )));
      } else {
        final response = await httpClient
            .post(ApisLink.baseUrl + ApisLink.checkSmsApi, data: {
          "mobile": mobileNumber,
          "code": code,
        }).then((value) {
          debugPrint(value.data.toString());
          if (value.statusCode == 201) {
            SharedPrefrencesManager()
                .saveString("token", value.data["data"]["token"]);
            SharedPrefrencesManager().getString("token");

            if (value.data["data"]["is_registered"]) {
              emit(AuthRegistered());
            } else {
              emit(AuthUnRegistered());
            }
          } else {
            emit(AuthErrorState(AppException()));
          }
        });
      }
    } catch (e) {
      emit(AuthErrorState(AppException()));
    }
  }

  registeration(var image, String phone, String name, String address,
      String postalCode, double lat, double lng) async {
    emit(AuthLoadingState());
    final formData = FormData.fromMap({
      "image": image,
      "phone": phone,
      "name": name,
      "address": address,
      "postal_code": postalCode,
      "lat": lat,
      "lng": lng
    });
    try {
      var resposne = await httpClient
          .post(ApisLink.baseUrl + ApisLink.registerApi, data: formData);
      if (resposne.statusCode == 201) {
        emit(AuthRegistered());
      } else {
        emit(AuthUnRegistered());
      }
    } catch (e) {
      emit(AuthErrorState(AppException()));
    }
  }
}
