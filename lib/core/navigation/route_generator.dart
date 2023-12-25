import 'package:flutter/material.dart';
import 'package:postview/feature/posts/presentation/pages/post_listview.dart';

import '../../feature/authors/domain/enitity/post_by_author_param.dart';
import '../../feature/authors/presentation/pages/authors_listview.dart';



class RouteGenerator {
  RouteGenerator._();

  static const postListPage = '/posts_list';
  static const authorsListPage = '/authors_list';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case postListPage:
        final PostByAuthorParam? postByAuthorParam = settings.arguments as PostByAuthorParam?;
        if (postByAuthorParam != null) {
          return animatedRoute(PostListView(postByAuthorParam: postByAuthorParam));
        } else {
          return animatedRoute(PostListView(postByAuthorParam: PostByAuthorParam()));
        }

      case authorsListPage:
        return animatedRoute(const AuthorsListView());


      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> normalRoute(Widget screenName) {
    return MaterialPageRoute(builder: (_) => screenName);
  }

  static PageRouteBuilder animatedRoute(Widget screenName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screenName,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.black38),
          foregroundColor: Colors.white,
          title: const Text(""),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Center(
          child: SizedBox(height: 200, width: 250, child: SizedBox()),
        ),
      );
    });
  }

}
