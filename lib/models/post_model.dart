class Post {
  final String thumbnail;
  final String author;
  final String community;
  final String relativeTime;
  final String title;
  final String shortDescription;
  final int votes;
  final int comments;

  Post({
    required this.thumbnail,
    required this.author,
    required this.community,
    required this.relativeTime,
    required this.title,
    required this.shortDescription,
    required this.votes,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    // Safely extract thumbnail
    String? thumbnail = '';
    if (json['json_metadata'] != null &&
        json['json_metadata']['image'] != null &&
        json['json_metadata']['image'] is List &&
        (json['json_metadata']['image'] as List).isNotEmpty) {
      thumbnail = json['json_metadata']['image'].first;
    }

    // Safely truncate the body to 1000 characters if present
    final body = json['body'] ?? '';

    return Post(
      thumbnail: thumbnail ?? '', // Fallback to an empty string if null
      author: json['author'] ?? 'Unknown Author',
      community: json['community_title'] ?? 'Unknown Community',
      relativeTime: json['created'] ?? DateTime.now().toIso8601String(),
      title: json['title'] ?? 'Untitled',
      shortDescription: body.length > 1000 ? body.substring(0, 1000) : body,
      votes: json['net_votes'] ?? 0, // Default to 0 if null
      comments: json['children'] ?? 0, // Default to 0 if null
    );
  }
}
