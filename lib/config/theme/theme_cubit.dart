import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),

    appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
    brightness: Brightness.light,
    backgroundColor: Colors.green,
    cardColor: Colors.white

  );


  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(
        0xFFBA0E72,
      ),
    ),scaffoldBackgroundColor: Colors.black12,
    brightness: Brightness.dark,
    cardColor: Colors.black54
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
