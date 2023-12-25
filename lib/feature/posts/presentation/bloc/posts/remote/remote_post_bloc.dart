import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:postview/core/resources/data_state.dart';
import 'package:postview/feature/posts/domain/entity/get_image_params.dart';
import 'package:postview/feature/posts/domain/entity/get_post_by_authors_param.dart';
import 'package:postview/feature/posts/domain/entity/post_image.dart';
import 'package:postview/feature/posts/domain/usecases/get_image_post_usecase.dart';

import '../../../../domain/entity/post.dart';
import '../../../../domain/entity/post_with_images.dart';
import '../../../../domain/usecases/get_post_by_authors_usecase.dart';
import '../../../../domain/usecases/get_post_usecase.dart';

part 'remote_post_event.dart';
part 'remote_post_state.dart';

class RemotePostBloc extends Bloc<RemotePostEvent, RemotePostState> {
  final GetPostsUseCase getPostsUseCase;
  final GetImagePostUseCase getImagePostUseCase;
  final GetPostByAuthorsUseCases getPostByAuthorsUseCases;

  RemotePostBloc({required this.getPostsUseCase,required this.getImagePostUseCase,required this.getPostByAuthorsUseCases}) : super(RemotePostInitial()) {
    on<LoadPost>((event, emit) async {
      emit(RemotePostLoading());
      final DataState dataState = await getPostsUseCase.call();
      if(dataState is SuccessResponse) {
        List<Posts> postList= dataState.value ;
        final List<PostWithImage> postsWithImages = await Future.wait(

          postList.map((post) async {
            final DataState imageDataState = await getImagePostUseCase.call(params: GetImageParams(postId: post.id));
            if(imageDataState is SuccessResponse) {
              PostImage image=  imageDataState.value as PostImage;
              return PostWithImage(post: post, imageUrl: image.thumbnailUrl);
            }else{
              return PostWithImage(post:post,imageUrl:"",imageLoaded: false);
            }
          }),
        );
        emit(RemotePostLoaded(postWithImages: postsWithImages));
      }else if(dataState is ErrorResponse){
        emit(RemotePostError(error: dataState.error));
      }
    });
    on<LoadPostByAuthors>((event, emit) async {
      emit(RemotePostLoading());
      final DataState dataState = await getPostByAuthorsUseCases.call(params: GetPostByAuthorsParam(userID: event.userId));
      if(dataState is SuccessResponse) {
        List<Posts> postList= dataState.value ;
        final List<PostWithImage> postsWithImages = await Future.wait(

          postList.map((post) async {
            final DataState imageDataState = await getImagePostUseCase.call(params: GetImageParams(postId: post.id));
            if(imageDataState is SuccessResponse) {
              PostImage image=  imageDataState.value as PostImage;
              return PostWithImage(post: post, imageUrl: image.thumbnailUrl);
            }else{
              return PostWithImage(post:post,imageUrl:"",imageLoaded: false);
            }
          }),
        );
        emit(RemotePostLoaded(postWithImages: postsWithImages));
      }else if(dataState is ErrorResponse){
        emit(RemotePostError(error: dataState.error));
      }
    });
  }
}
