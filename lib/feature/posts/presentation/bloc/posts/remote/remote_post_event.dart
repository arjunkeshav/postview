part of 'remote_post_bloc.dart';

abstract class RemotePostEvent extends Equatable {
  const RemotePostEvent();
}

class LoadPost extends RemotePostEvent{
  @override
  List<Object?> get props => [];
}
class LoadPostByAuthors extends RemotePostEvent{
  final int userId;

  const LoadPostByAuthors({required this.userId});

  @override
  List<Object?> get props => [userId];
}
