import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postview/common/widgets/common_app_bar.dart';
import 'package:postview/common/widgets/common_app_drawer.dart';
import 'package:postview/feature/authors/presentation/bloc/author/author_bloc.dart';
import 'package:postview/feature/authors/presentation/widgets/author_view.dart';

import '../../../../injection_container.dart';

class AuthorsListView extends StatelessWidget {
  const AuthorsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthorBloc>()..add(LoadAllAuthors()),
      child: Scaffold(
        appBar: CommonAppbar(
          title: "Authors",
          refreshButtonOnPressed: () => sl<AuthorBloc>().add(LoadAllAuthors()),
          fromAuthor: false,
        ),
        drawer: const CommonAppDrawer(
          authorSelected: true,
        ),
        body: BlocBuilder<AuthorBloc, AuthorState>(
          key: UniqueKey(),
          builder: (context, state) {
            if (state is AuthorLoadedState) {
              return ListView.builder(
                  itemCount: state.authorsDetails.length,
                  itemBuilder: (context, index) => AuthorView(
                        authorsDetails: state.authorsDetails[index],
                      ));
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
