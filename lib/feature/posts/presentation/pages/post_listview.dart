import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postview/common/widgets/common_app_bar.dart';
import 'package:postview/feature/posts/presentation/bloc/posts/remote/remote_post_bloc.dart';

import '../../../../common/widgets/common_app_drawer.dart';
import '../../../../injection_container.dart';
import '../../../authors/domain/enitity/post_by_author_param.dart';
import '../widgets/post_widget.dart';

class PostListView extends StatefulWidget {
  final PostByAuthorParam postByAuthorParam;

  const PostListView({Key? key, required this.postByAuthorParam}) : super(key: key);

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemotePostBloc>(
      create: (context) => sl()
        ..add(widget.postByAuthorParam.fromAuthor
            ? LoadPostByAuthors(userId: widget.postByAuthorParam.userId)
            : LoadPost()),
      child: Scaffold(
        drawer: const CommonAppDrawer(
          authorSelected: false,
        ),
        appBar: CommonAppbar(
          title: "Posts ${widget.postByAuthorParam.userName}",
          refreshButtonOnPressed: () => sl<RemotePostBloc>().add(widget.postByAuthorParam.fromAuthor
              ? LoadPostByAuthors(userId: widget.postByAuthorParam.userId)
              : LoadPost()),
          fromAuthor: widget.postByAuthorParam.fromAuthor,
        ),
        body: BlocBuilder<RemotePostBloc, RemotePostState>(
          builder: (context, state) {
            if (state is RemotePostLoaded) {
              return ListView.builder(
                  itemCount: state.postWithImages.length,
                  itemBuilder: (context, index) => PostWidget(postWithImage: state.postWithImages[index]));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
