import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/model/user_form_auth.dart';
import 'package:watchstore/gen/fonts.gen.dart';
import 'package:watchstore/utils/shared_prefrences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Dio dio = Dio();
  RegisterCubit() : super(RegisterInitial());

  pickLocation({required context}) async {
    await showSimplePickerLocation(
            context: context,
            isDismissible: true,
            textCancelPicker: 'لغو',
            textConfirmPicker: 'تایید آدرس',
            radius: 12,
            title: 'انتخاب موقعیت مکانی',
            zoomOption: const ZoomOption(initZoom: 8),
            contentPadding: const EdgeInsets.all(12),
            initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324))
        .then((value) => emit(LocationPickedState(location: value)));
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
