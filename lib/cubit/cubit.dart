import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_bloc/cubit/state.dart';
import 'package:pagination_bloc/data/model.dart';
import 'package:pagination_bloc/data/repository.dart';

class PaginationCubit extends Cubit<PostState>{
  PaginationCubit(this.postRepository) : super(InitialState());
final PostRepository postRepository;
  int page = 1;
  List<Post> posts=[];
  void fetchPost()async{
    emit(LoadingPosts());

    await postRepository.fetchPost(page).then((newPosts){
      if(newPosts.isEmpty){
        emit(StopLoading());
        return;
      }
      page++;
      posts.addAll(newPosts);
   emit(LoadedPosts(posts));
    });
  }

}