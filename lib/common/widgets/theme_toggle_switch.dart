import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/theme/theme_cubit.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Switch(
          value: theme.brightness == Brightness.dark,
          onChanged: (value) {
            context.read<ThemeCubit>().toggleTheme();
          },
        );
      },
    );
  }
}