import 'package:beauty_of_space/domain/models/apod/picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class PicturesDetail extends StatelessWidget {
  const PicturesDetail({
    Key? key,
    required this.pic,
  }) : super(key: key);

  final Picture pic;

  @override
  Widget build(BuildContext context) {
    print(pic.url);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: context.height * 0.4,
            pinned: true,
            snap: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                pic.title,
                style: const TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ),
              background: Image.network(
                pic.url,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 64,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(pic.explanation),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (pic.url.contains("youtube.com/embed"))
                  TextButton(
                    onPressed: () {
                      launch(pic.url);
                    },
                    child: Text("Open "),
                  ),
                TextButton(
                  onPressed: () {
                    Share.share("""
${pic.url}
${pic.explanation}
""");
                  },
                  child: Text("Share"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
