import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/nasa_api_service.dart';
import 'apod_event.dart';
import 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final NasaApiService _nasaApiService;

  ApodBloc(this._nasaApiService) : super(ApodInitial()) {
    on<LoadApod>(_onLoadApod);
  }

  Future<void> _onLoadApod(LoadApod event, Emitter<ApodState> emit) async {
    emit(ApodLoading());
    try {
      final apod = await _nasaApiService.getAstronomyPictureOfTheDay();
      emit(ApodLoaded(apod));
    } catch (e) {
      emit(ApodError(e.toString()));
    }
  }
}
