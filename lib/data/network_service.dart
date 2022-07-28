import 'package:dio/dio.dart';

class PostService {
  late Dio dio;
  final fetchLimit = 20;
  final baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  PostService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  Future<List<dynamic>> fetchPost(int page) async {
    try {
      final response = await dio.get(
          baseUrl + '?_limit=$fetchLimit&_page=$page');
      return response.data ;
    } catch (error) {
      print(error);
      return [];
    }
  }
}