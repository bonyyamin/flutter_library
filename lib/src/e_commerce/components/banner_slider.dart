import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

/// Model for banner data
class BannerItem {
  final String imageUrl;
  final VoidCallback onTap;

  BannerItem({required this.imageUrl, required this.onTap});
}

/// A swipeable promotional banner slider.
class BannerSlider extends StatefulWidget {
  final List<BannerItem> banners;
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final bool showIndicator;

  const BannerSlider({
    Key? key,
    required this.banners,
    this.height = 180,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.showIndicator = true,
  }) : super(key: key);

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height,
            autoPlay: widget.autoPlay,
            autoPlayInterval: widget.autoPlayInterval,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.banners.map((banner) {
            return GestureDetector(
              onTap: banner.onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  banner.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          }).toList(),
        ),
        if (widget.showIndicator) ...[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.banners.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentIndex == index ? 12 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}



//how to use
/*
BannerSlider(
  banners: [
    BannerItem(
      imageUrl: "https://via.placeholder.com/600x300",
      onTap: () => print("Clicked Banner 1"),
    ),
    BannerItem(
      imageUrl: "https://via.placeholder.com/600x300",
      onTap: () => print("Clicked Banner 2"),
    ),
  ],
)
*/

/*
Key Features of This Widget:
✅ Auto-Play Support – Banners cycle automatically (configurable).
✅ Swipeable Image Slider – Uses carousel_slider package for smooth transitions.
✅ Clickable Banners – Each banner can have an onTap action.
✅ Page Indicator Dots – Highlights the active slide dynamically.
*/