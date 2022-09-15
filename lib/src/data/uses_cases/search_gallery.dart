import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:photos_fake/src/data/models/models.dart';
import 'package:photos_fake/src/data/repository/gallery_repository.dart';
import 'package:photos_fake/src/data/uses_cases/uses_cases.dart';
import 'package:photos_fake/src/utils/local_repository.dart';

class SearchGalleryUseCase implements UseCase<void, String> {
  GalleryRepository galleryRepository = GalleryRepository();
  @override
  Future call({String? params}) async {
    LocalRepository localRepository = LocalRepository();
    final http.Response response =
        await galleryRepository.searchGallery(params!);
    if (response.statusCode == 200 || response.statusCode == 201) {
      localRepository.setLocalStorageString('search', response.body);
      return response.body;
    } else {
      throw UseCaseException('Bad request');
    }
  }
}
