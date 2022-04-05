import 'package:cubittest/cubit/weather_cubit.dart';
import 'package:cubittest/data/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/weather_search_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: BlocProvider(
          //create: (context) => WeatherBloc(FakeWeatherRepository()),
          create: (context) => WeatherCubit(FakeWeatherRepository()),
          child: WeatherSearchPage()),
    );
  }
}
