import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:photos_fake/src/data/models/models.dart';
import 'package:photos_fake/src/data/repository/gallery_repository.dart';
import 'package:photos_fake/src/data/uses_cases/uses_cases.dart';
import 'package:photos_fake/src/utils/local_repository.dart';

class ListGalleryUseCase implements UseCase<void, Gallery> {
  GalleryRepository galleryRepository = GalleryRepository();
  @override
  Future call({Gallery? params}) async {
    LocalRepository localRepository = LocalRepository();
    final http.Response response = await galleryRepository.getGallery();
    if (response.statusCode == 200 || response.statusCode == 201) {
      //print('response body: ${json.decode(response.body)}');
      //print(galleryFromJson(response.body));
      localRepository.setLocalStorageString(
          'gallery', json.encode(response.body));
    } else {
      throw UseCaseException('Bad request');
    }
  }
}
