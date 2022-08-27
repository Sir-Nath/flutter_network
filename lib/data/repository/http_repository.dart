import 'dart:convert';

import 'package:flutter_network/data/provider/http/http.dart';
import '../model/data_model.dart';

class HttpRepository{
  final postClient = PostClient();
  late Future<PostModel> post;
  Future<PostModel> fetchPost(int postId)async{
    final fetchedPost = await postClient.fetchPost(postId);
    final post = PostModel.fromJson(json.decode(fetchedPost));
    return post;
  }
}