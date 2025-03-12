import 'package:flutter/material.dart';
import '../styles/news_text_styles.dart';
import '../styles/news_card_styles.dart';

class CommentSection extends StatefulWidget {
  final List<Comment> comments;
  final Function(String) onAddComment;

  const CommentSection({
    Key? key,
    required this.comments,
    required this.onAddComment,
  }) : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();

  void _submitComment() {
    if (_commentController.text.trim().isNotEmpty) {
      widget.onAddComment(_commentController.text.trim());
      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          "Comments",
          style: NewsTextStyles.headline2(isDarkMode: isDarkMode),
        ),
        const SizedBox(height: 12),

        // Comment List
        widget.comments.isEmpty
            ? Center(
                child: Text(
                  "No comments yet. Be the first to comment!",
                  style: NewsTextStyles.bodyText2(isDarkMode: isDarkMode),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.comments.length,
                itemBuilder: (context, index) {
                  final comment = widget.comments[index];
                  return _buildCommentTile(comment, isDarkMode);
                },
              ),

        const SizedBox(height: 16),

        // Add Comment Input
        Container(
          padding: const EdgeInsets.all(8),
          decoration: NewsCardStyles.cardDecoration(isDarkMode: isDarkMode),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    hintText: "Write a comment...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: _submitComment,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommentTile(Comment comment, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: NewsCardStyles.cardDecoration(isDarkMode: isDarkMode),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Icon
          CircleAvatar(
            backgroundImage: NetworkImage(comment.userAvatar),
            radius: 20,
            onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 40),
          ),
          const SizedBox(width: 12),

          // Comment Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.username,
                  style: NewsTextStyles.bodyText1(isDarkMode: isDarkMode)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.text,
                  style: NewsTextStyles.bodyText2(isDarkMode: isDarkMode),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Comment model
class Comment {
  final String username;
  final String userAvatar;
  final String text;

  Comment({
    required this.username,
    required this.userAvatar,
    required this.text,
  });
}




//how to use
/*
CommentSection(
  comments: [
    Comment(
      username: "John Doe",
      userAvatar: "https://example.com/avatar1.jpg",
      text: "Great article! Thanks for sharing.",
    ),
    Comment(
      username: "Jane Smith",
      userAvatar: "https://example.com/avatar2.jpg",
      text: "Very insightful, I learned a lot.",
    ),
  ],
  onAddComment: (comment) {
    print("New Comment: $comment");
    // Add the comment to the list and update state
  },
);
*/