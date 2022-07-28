import 'package:pagination_bloc/data/model.dart';
import 'package:pagination_bloc/data/network_service.dart';

class PostRepository{
  final PostService postService;

  PostRepository(this.postService);

  Future<List<Post>> fetchPost(int page) async{
    final posts= await postService.fetchPost(page);
     return posts.map((e) => Post.fromJson(e)).toList();

  }
}