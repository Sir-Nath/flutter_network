import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../model/data_model.dart';

class PostClient {
  static const baseURL = 'https://jsonplaceholder.typicode.com';
  static const postsEndpoint = '$baseURL/posts';

  Future<PostModel> fetchPost(int postId) async {
    final url = Uri.parse('$postsEndpoint/$postId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load post: $postId');
    }
  }

  Future<List<PostModel>> fetchAllPost() async {
    final url = Uri.parse(postsEndpoint);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PostModelFromJson(response.body);
    } else {
      throw Exception('failed to load posts');
    }
  }

  Future<PostModel> createPost(int userId, String title, String body) async {
    final url = Uri.parse(postsEndpoint);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "userId": userId,
          "title": title,
          "body": body,
        }));
    if (response.statusCode == 201) {
      return PostModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to create post');
    }
  }

  Future<PostModel> updatePost(int id, int userId, String title, String body) async {
    final url = Uri.parse('$postsEndpoint/$id');
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "userId": userId,
          "title": title,
          "body": body,
        }));
    if (response.statusCode == 200) {
      log(response.body);
      return PostModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to update post');
    }
  }

  Future<String> deletePost(int id) async {
    final url = Uri.parse('$postsEndpoint/$id');
    final response = await http.delete(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },);
    if (response.statusCode == 200) {
      log(response.body);
      return 'Delete Successful';
    }else{
      throw Exception('failed to delete post');
    }
  }


}
