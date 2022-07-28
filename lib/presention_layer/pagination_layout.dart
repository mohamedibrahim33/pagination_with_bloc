import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_bloc/cubit/cubit.dart';
import 'package:pagination_bloc/cubit/state.dart';
import 'package:pagination_bloc/data/model.dart';

class PaginationLayout extends StatelessWidget {
  List<Post> posts = [];
  var scrollController = ScrollController();
  bool moreThanLength=false;
  bool stopLoading=false;
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        BlocProvider.of<PaginationCubit>(context).fetchPost();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PaginationCubit>(context);
    return Scaffold(
      body: BlocBuilder<PaginationCubit, PostState>(
        builder: (context, state) {
          if (state is LoadedPosts) {
            posts = state.posts;
            moreThanLength=true;
            stopLoading=false;
          }else{
            stopLoading=true;
          }
          return _buildListView();
        },
      ),
    );
  }

  Widget _buildListView() {
    return moreThanLength?ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        if(index==posts.length){
          if(stopLoading){
            return Container();
          }
          return defaultCircleIndicator();
        }
        return Card(
          child: Text(
            posts[index].id.toString() + " " + posts[index].title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      itemCount: posts.length + (moreThanLength?1:0),
    ):defaultCircleIndicator();
  }
  Widget defaultCircleIndicator(){
    return const Center(child:  CircularProgressIndicator());
  }
}
