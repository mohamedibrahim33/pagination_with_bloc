import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_bloc/cubit/cubit.dart';
import 'package:pagination_bloc/data/repository.dart';
import 'package:pagination_bloc/presention_layer/pagination_layout.dart';

import 'data/network_service.dart';

void main() {
  runApp( MyApp(
    postRepository: PostRepository(PostService()),
  ));
}

class MyApp extends StatelessWidget {
  final PostRepository postRepository;


    const MyApp({Key? key,   required this.postRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) {
          return PaginationCubit(postRepository)..fetchPost();
        },
          child: PaginationLayout()),
    );
  }
}
