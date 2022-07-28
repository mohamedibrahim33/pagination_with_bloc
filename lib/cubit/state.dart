import 'package:pagination_bloc/data/model.dart';

abstract class PostState {}
class InitialPost extends PostState{}

class InitialState extends PostState{}
class LoadingPosts extends PostState{
//  final List<Post> posts;
//  LoadingPosts(this.posts);
}
class LoadedPosts extends PostState{
  final List<Post> posts;
  LoadedPosts(this.posts);

}
class StopLoading extends PostState{
}



