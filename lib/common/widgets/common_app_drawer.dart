import 'package:flutter/material.dart';

import '../../core/navigation/route_generator.dart';

class CommonAppDrawer extends StatelessWidget {
  final bool authorSelected;
  const CommonAppDrawer({Key? key,required this.authorSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
          child: ListView(
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Post view",style: TextStyle(color: Colors.white,fontSize: 30),)],)),
          ListTile(
            title: const Text('Posts'),
            onTap: () {
              Navigator.pushReplacementNamed(context,RouteGenerator.postListPage);
            },
            tileColor: authorSelected?Colors.transparent:Colors.grey,
          ),
          ListTile(
            title: const Text('Authors'),
            onTap: () {
              Navigator.pushReplacementNamed(context,RouteGenerator.authorsListPage);
            },
            tileColor: authorSelected?Colors.grey:Colors.transparent,
          ),
      ],
    ),
        ));
  }
}
