import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/model/home_model.dart';
import 'package:watchstore/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository iHomeRepository;

  HomeBloc(this.iHomeRepository) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInit) {
        try {
          emit(HomeLoading());
          final response = await iHomeRepository.getHome();
          emit(HomeSuccess(homeModel: response));
        } catch (e) {
          emit(HomeError(appException: AppException()));
          debugPrint('this is Exception ${e.toString()}');
        }
      }
    });
  }
}
