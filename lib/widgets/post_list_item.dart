import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  const PostListItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Image.network(
              post.thumbnail ?? '',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image),
                );
              },
            ),
            const SizedBox(width: 12),
            // Post Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Author and Community
                  Text(
                    'by @${post.author} • ${post.community}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  // Votes and Comments
                  Row(
                    children: [
                      Icon(Icons.thumb_up, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        '${post.votes} votes',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.comment, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        '${post.comments} comments',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
