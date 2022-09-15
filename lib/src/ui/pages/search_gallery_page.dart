import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:photos_fake/src/controllers/search_gallery_controller.dart';
import 'package:photos_fake/src/utils/responsive.dart';
import 'package:provider/provider.dart';

class SearchGalleryPage extends StatelessWidget {
  const SearchGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return Column(children: <Widget>[
      SizedBox(
        height: responsive.heightResponsive(10),
        width: responsive.width,
        child: const Center(
          child: _SearchForm(),
        ),
      ),
      const Expanded(child: _GalleryBuilder())
    ]);
  }
}

class _SearchForm extends StatelessWidget {
  const _SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchGalleryController searchGalleryController = context.watch();
    Responsive responsive = Responsive.of(context);

    return Form(
        key: searchGalleryController.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Row(
          children: [
            SizedBox(width: responsive.widthResponsive(0.5)),
            SizedBox(
              width: responsive.widthResponsive(70),
              height: responsive.heightResponsive(10),
              child: TextField(
                controller: searchGalleryController.textController,
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'Search', labelText: 'Search'),
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (searchGalleryController.formKey.currentState!
                      .validate()) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    searchGalleryController.getGalleryImageLarge(value);
                  }
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              child: const Text('Search'),
              onPressed: () async {
                if (searchGalleryController.formKey.currentState!.validate()) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  searchGalleryController.getGalleryImageLarge(
                      searchGalleryController.textController.text);
                }
              },
            ),
          ],
        ));
  }
}

class _GalleryBuilder extends StatelessWidget {
  const _GalleryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchGalleryController searchGalleryController = context.watch();
    List gallery = searchGalleryController.listImageSmall;
    if (searchGalleryController.listImageSmall != null) {
      if (gallery.isNotEmpty) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: gallery.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                searchGalleryController.getCurrentPhoto(index);
                Navigator.pushNamed(context, '/imageDetailSearch');
              },
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.network(gallery[index], fit: BoxFit.cover),
              ),
            );
          },
        );
      } else {
        return const Center(child: Text('No results found'));
      }
    } else {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
  }
}
