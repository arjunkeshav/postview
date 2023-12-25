import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/theme_cubit.dart';
import 'core/navigation/route_generator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: const AppView(),
    );
  }
}


class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          theme: theme,
          builder: (context, child) {
            return MediaQuery(
              // Set the default textScaleFactor to 1.0 for the whole subtree.
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: MediaQuery.of(context).size.shortestSide < 600 ? 0.85 : 1.5),
              child: child!,
            );
          },
          initialRoute: RouteGenerator.postListPage,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
