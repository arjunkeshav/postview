part of 'author_bloc.dart';

abstract class AuthorEvent extends Equatable {
  const AuthorEvent();
}

class LoadAllAuthors extends AuthorEvent{
  @override
  List<Object?> get props => [];

}
class LoadError extends AuthorEvent{
  @override
  List<Object?> get props => [];

}
