import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../styles/news_text_styles.dart';
import '../styles/news_card_styles.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final String title;
  final String source;

  const AudioPlayerWidget({
    Key? key,
    required this.audioUrl,
    required this.title,
    required this.source,
  }) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setUrl(widget.audioUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayback() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: NewsCardStyles.cardDecoration(isDarkMode: isDarkMode),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: NewsTextStyles.headline2(isDarkMode: isDarkMode),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            widget.source,
            style: NewsTextStyles.caption(isDarkMode: isDarkMode),
          ),
          const SizedBox(height: 12),

          // Audio Playback Controls
          StreamBuilder<Duration?>(
            stream: _audioPlayer.positionStream,
            builder: (context, snapshot) {
              final position = snapshot.data ?? Duration.zero;
              return Column(
                children: [
                  Slider(
                    value: position.inSeconds.toDouble(),
                    max: (_audioPlayer.duration?.inSeconds ?? 1).toDouble(),
                    onChanged: (value) async {
                      await _audioPlayer.seek(Duration(seconds: value.toInt()));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(position),
                        style: NewsTextStyles.caption(isDarkMode: isDarkMode),
                      ),
                      Text(
                        _formatDuration(_audioPlayer.duration ?? Duration.zero),
                        style: NewsTextStyles.caption(isDarkMode: isDarkMode),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          // Play/Pause Button
          Center(
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                size: 48,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
              onPressed: _togglePlayback,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }
}


//how to use
/*
AudioPlayerWidget(
  title: "Podcast: The Future of AI",
  audioUrl: "https://example.com/audio.mp3",
  source: "Tech News Podcast",
)
*/