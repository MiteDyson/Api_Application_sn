import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  static Future<List<Post>> fetchPosts() async {
    const url = 'https://api.hive.blog/';
    const body = {
      "id": 1,
      "jsonrpc": "2.0",
      "method": "bridge.get_ranked_posts",
      "params": {"sort": "trending", "tag": "", "observer": "hive.blog"}
    };

    final response =
        await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List posts = data['result'];
      return posts.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
