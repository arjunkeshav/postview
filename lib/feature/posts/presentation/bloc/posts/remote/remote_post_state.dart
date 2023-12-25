part of 'remote_post_bloc.dart';

abstract class RemotePostState extends Equatable {
  const RemotePostState();
}

class RemotePostInitial extends RemotePostState {
  @override
  List<Object> get props => [];
}

class RemotePostLoading extends RemotePostState {
  @override
  List<Object> get props => [];
}


class RemotePostLoaded extends RemotePostState {
  final List<PostWithImage> postWithImages;
  const RemotePostLoaded({required this.postWithImages});

  @override
  List<Object> get props => [postWithImages];
}
class RemotePostError extends RemotePostState {
  final DioException error;
  const RemotePostError({required this.error});

  @override
  List<Object> get props => [error];
}
