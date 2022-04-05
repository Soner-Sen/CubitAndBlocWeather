import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/weather.dart';
import '../data/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());
  //Future weil Fetchdata auch async ist, geben nichts zurück <void>
  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      //fetchen die Daten aus dem Repository
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError('Could not fetch weather. Is the device online?'));
    }
  }
}
