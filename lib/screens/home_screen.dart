import 'package:api_app/api/api_service.dart';
import 'package:flutter/material.dart';
// import '../services/api_service.dart';
import '../models/post_model.dart';
import '../widgets/post_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = ApiService.fetchPosts(); // Fetching directly as a List<Post>
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending Posts')),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return PostListItem(
                  post: post,
                ); // Pass the Post object directly
              },
            );
          }
        },
      ),
    );
  }
}
