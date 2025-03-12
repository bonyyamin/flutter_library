import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  final bool isBookmarked;
  final VoidCallback onToggle;

  const BookmarkButton({
    Key? key,
    required this.isBookmarked,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  late bool _bookmarked;

  @override
  void initState() {
    super.initState();
    _bookmarked = widget.isBookmarked;
  }

  void _toggleBookmark() {
    setState(() {
      _bookmarked = !_bookmarked;
    });
    widget.onToggle();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Icon(
          _bookmarked ? Icons.bookmark : Icons.bookmark_border,
          key: ValueKey<bool>(_bookmarked),
          color: isDarkMode ? Colors.white70 : Colors.black54,
        ),
      ),
      onPressed: _toggleBookmark,
    );
  }
}


//how to use
/*
BookmarkButton(
  isBookmarked: false, // Set initial state
  onToggle: () {
    // Handle bookmarking logic
  },
)
*/