import 'package:postview/core/resources/data_state.dart';
import 'package:postview/feature/posts/data/datasources/remote/posts_by_authors_remote_data_source_impl.dart';
import 'package:postview/feature/posts/domain/entity/post.dart';
import 'package:postview/feature/posts/domain/entity/post_image.dart';
import 'package:postview/feature/posts/domain/repository/post_repository.dart';

import '../datasources/remote/image_post_remote_data_source_impl.dart';
import '../datasources/remote/post_remote_data_source_impl.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSourceImpl postRemoteDataSourceImpl;
  final ImagePostRemoteDataSourceImpl imagePostRemoteDataSourceImpl;
  final PostsByAuthorsRemoteDataSourceImpl postsByAuthorsRemoteDataSourceImpl;

  PostRepositoryImpl( {required this.postsByAuthorsRemoteDataSourceImpl,required this.postRemoteDataSourceImpl, required this.imagePostRemoteDataSourceImpl});

  @override
  Future<DataState> getPosts() async {
    return await postRemoteDataSourceImpl.fetchPosts();
  }

  @override
  Future<DataState> getImageForPost({required int postId}) async {
    return await imagePostRemoteDataSourceImpl.fetchImages(postId: postId);
  }

  @override
  Future<DataState> getPostsByAuthors({required int userId}) async {
    return await postsByAuthorsRemoteDataSourceImpl.fetchPostsByAuthors(userId: userId) ;
  }
}
