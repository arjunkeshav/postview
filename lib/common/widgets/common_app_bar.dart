import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme/theme_cubit.dart';
import 'theme_toggle_switch.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback refreshButtonOnPressed;
  final String title;
  final bool fromAuthor;
  const CommonAppbar({Key? key,required this.refreshButtonOnPressed,required this.title,required this.fromAuthor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title),
      leading: Builder(
        builder: (BuildContext context) {
          return  IconButton(
            icon: Icon(fromAuthor?Icons.arrow_back:Icons.menu),
            onPressed: () {
              if(fromAuthor){
                Navigator.pop(context);
              }else {
                Scaffold.of(context).openDrawer();
              }
            },
          );
        },
      ),

      actions: [
        Builder(
          builder: (context) {
            return IconButton(onPressed:refreshButtonOnPressed , icon: const Icon(Icons.refresh));
          }
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
              onTap: () =>context.read<ThemeCubit>().toggleTheme(),
              child: const ThemeToggleSwitch()),
        ),

      ],);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
