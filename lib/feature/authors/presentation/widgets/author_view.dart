import 'package:flutter/material.dart';
import 'package:postview/core/navigation/route_generator.dart';
import 'package:postview/feature/authors/domain/enitity/authors_details.dart';

import '../../domain/enitity/post_by_author_param.dart';

class AuthorView extends StatelessWidget {
  final AuthorsDetails authorsDetails;
  const AuthorView({Key? key,required this.authorsDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=>Navigator.pushNamed(context, RouteGenerator.postListPage,arguments: PostByAuthorParam(fromAuthor: true,userId:authorsDetails.id,userName: "by ${authorsDetails.name}")),
      leading: const Icon(Icons.person),
      title: Text(authorsDetails.name),
    );
  }
}
