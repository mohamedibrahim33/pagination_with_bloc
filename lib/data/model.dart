class Post{
  late int id;
  late String body;
  late String title;
  Post.fromJson(Map<String,dynamic> map){
    id=map['id'];
    body=map['body'];
    title=map['title'];
  }
}