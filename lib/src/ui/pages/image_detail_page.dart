import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailPage extends StatelessWidget {
  String photo;

  ImageDetailPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PhotoView(
          imageProvider: NetworkImage(photo),
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.covered * 1.1,
          initialScale: PhotoViewComputedScale.contained * 0.8,
          basePosition: Alignment.center,
          gaplessPlayback: true,
          heroAttributes:  const PhotoViewHeroAttributes(tag: 'image'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white12,
        elevation: 0,
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
