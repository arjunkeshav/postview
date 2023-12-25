part of 'author_bloc.dart';

abstract class AuthorState extends Equatable {
  const AuthorState();
}

class AuthorInitialState extends AuthorState {
  @override
  List<Object> get props => [];
}

class AuthorLoadingState extends AuthorState {
  @override
  List<Object> get props => [];
}

class AuthorLoadedState extends AuthorState {
  final List<AuthorsDetails> authorsDetails;

  const AuthorLoadedState({required this.authorsDetails});
  @override
  List<Object> get props => [authorsDetails];
}

class AuthorErrorState extends AuthorState {
  @override
  List<Object> get props => [];
}
