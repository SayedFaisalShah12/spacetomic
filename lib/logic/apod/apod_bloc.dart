import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/apod_api_service.dart';
import 'apod_event.dart';
import 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final ApodApiService apodApiService;

  ApodBloc({required this.apodApiService}) : super(ApodInitial()) {
    on<LoadApod>((event, emit) async {
      try {
        emit(ApodLoading());
        final apod = await apodApiService.getApod();
        emit(ApodLoaded(apod));
      } catch (e) {
        emit(ApodError(e.toString()));
      }
    });
  }
}
