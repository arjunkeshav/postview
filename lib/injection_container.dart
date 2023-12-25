

import 'package:get_it/get_it.dart';
import 'package:postview/feature/posts/data/datasources/remote/posts_by_authors_remote_data_source_impl.dart';
import 'package:postview/feature/posts/data/repository/post_repository_impl.dart';
import 'package:postview/feature/posts/domain/usecases/get_post_usecase.dart';
import 'package:postview/feature/posts/presentation/bloc/posts/remote/remote_post_bloc.dart';

import 'feature/authors/data/datasources/remote/authors_remote_date_source_impl.dart';
import 'feature/authors/data/repository/authors_repository_impl.dart';
import 'feature/authors/domain/usecases/get_authors_list_usecase.dart';
import 'feature/authors/presentation/bloc/author/author_bloc.dart';
import 'feature/posts/data/datasources/remote/image_post_remote_data_source_impl.dart';
import 'feature/posts/data/datasources/remote/post_remote_data_source_impl.dart';
import 'feature/posts/domain/usecases/get_image_post_usecase.dart';
import 'feature/posts/domain/usecases/get_post_by_authors_usecase.dart';

final sl= GetIt.instance;

Future<void> initializeDependencies()async{
  ///posts
  //datasource
  sl.registerSingleton<PostRemoteDataSourceImpl>(PostRemoteDataSourceImpl());
  sl.registerSingleton<ImagePostRemoteDataSourceImpl>(ImagePostRemoteDataSourceImpl());
  sl.registerSingleton<PostsByAuthorsRemoteDataSourceImpl>(PostsByAuthorsRemoteDataSourceImpl());

  //repository
  sl.registerSingleton<PostRepositoryImpl>(PostRepositoryImpl(postRemoteDataSourceImpl: sl(),imagePostRemoteDataSourceImpl: sl(),postsByAuthorsRemoteDataSourceImpl: sl()));

  //use case
  sl.registerSingleton<GetPostsUseCase>(GetPostsUseCase(postRepositoryImpl: sl()));
  sl.registerSingleton<GetImagePostUseCase>(GetImagePostUseCase(postRepositoryImpl: sl()));
  sl.registerSingleton<GetPostByAuthorsUseCases>(GetPostByAuthorsUseCases(postRepositoryImpl: sl()));

  //bloc
  sl.registerFactory<RemotePostBloc>(()=>RemotePostBloc(getPostsUseCase: sl(),getImagePostUseCase: sl(),getPostByAuthorsUseCases: sl()));

  ///Authors
  //datasource
  sl.registerSingleton<AuthorsRemoteDataSourceImpl>(AuthorsRemoteDataSourceImpl());

  //repository
  sl.registerSingleton<AuthorsRepositoryImpl>(AuthorsRepositoryImpl(authorsRemoteDataSourceImpl: sl()));

  //use case
  sl.registerSingleton<GetAuthorsListUseCase>(GetAuthorsListUseCase(authorsRepositoryImpl: sl()));

  //bloc
  sl.registerFactory<AuthorBloc>(()=>AuthorBloc(getAuthorsListUseCase: sl()));







}