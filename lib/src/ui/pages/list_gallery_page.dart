// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:photos_fake/src/controllers/controllers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class ListGalleryPage extends StatefulWidget {
  const ListGalleryPage({Key? key}) : super(key: key);

  @override
  State<ListGalleryPage> createState() => _ListGalleryPageState();
}

class _ListGalleryPageState extends State<ListGalleryPage> {
  List? photoList;

  @override
  Widget build(BuildContext context) {
    ListGalleryController listGalleryController = context.watch();

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: listGalleryController.listImageSmall!.length,
      itemBuilder: (context, index) {
        List<String> listPhotos = listGalleryController.listImageSmall!;
        if (listPhotos.isNotEmpty) {
          return Padding(
              padding: const EdgeInsets.all(2),
              child: GestureDetector(
                onTap: () async {
                  listGalleryController.getCurrentPhoto(index);
                  Navigator.pushNamed(context, '/imageDetail');
                },
                child: Image.network(
                  listPhotos[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.error),
                  //loadingBuilder: (_, __, ___) => const CircularProgressIndicator.adaptive(),
                ),
              ));
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}



// CachedNetworkImage(
//                 imageUrl: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
//                 placeholder: (context, url) =>
//                     const CircularProgressIndicator.adaptive(),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//                 fit: BoxFit.cover,
//               )