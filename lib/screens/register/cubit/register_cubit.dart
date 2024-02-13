import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/model/user_form_auth.dart';
import 'package:watchstore/utils/shared_prefrences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Dio dio = Dio();
  RegisterCubit() : super(RegisterInitial());

  getPickLocation({required BuildContext context}) async {
    await showSimplePickerLocation(
            context: context,
            isDismissible: true,
            textCancelPicker: 'لغو',
            textConfirmPicker: 'تایید آدرس',
            radius: 12,
            title: 'انتخاب موقعیت مکانی',
            zoomOption: const ZoomOption(initZoom: 12),
            contentPadding: const EdgeInsets.all(12),
            initPosition: GeoPoint(latitude: 35.7219, longitude: 51.3347))
        .then((value) async {
      final convert = await dio.get(
          'https://api.neshan.org/v5/reverse?lat=${value?.latitude}&lng=${value?.longitude}',
          options: Options(headers: {
            'Api-Key': 'service.4bb74f9402154199a6e400bd1e2ec3c7'
          }));
      emit(LocationPickedState(value,
          location: convert.data['formatted_address']));
    });
  }

  SendDataToServerFromregister({required UserFormAuth user}) async {
    emit(RegisterLoading());
    try {
      String? token = SharedPrefrencesManager().getString('token');
      dio.options.headers['Authorization'] = "Bearer $token";
      var respone = await dio
          .post(ApisLink.baseUrl + ApisLink.registerApi,
              data: FormData.fromMap(user.toMap()))
          .then((value) {
        if (value.statusCode == 201) {
          emit(RegisterSuccess());
        } else {
          emit(RegsiterError(exception: AppException()));
        }
      });
    } catch (e) {
      emit(RegsiterError(exception: AppException()));
      debugPrint(e.toString());
    }
  }
}
