part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  WeatherState();
}

class WeatherInitial extends WeatherState {
  WeatherState() {
    // TODO: implement WeatherState
    throw UnimplementedError();
  }
}

class WeatherLoading extends WeatherState {
  WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  //StateField is a class that holds the state of the field
  final Weather weather;
  WeatherLoaded(this.weather);

  //Value equality
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherLoaded &&
          runtimeType == other.runtimeType &&
          weather == other.weather;

  @override
  int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
