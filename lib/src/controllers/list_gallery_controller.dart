// ignore_for_file: unused_field, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photos_fake/src/data/models/models.dart';
import 'package:photos_fake/src/data/uses_cases/uses_cases.dart';
import 'package:photos_fake/src/utils/local_repository.dart';

class ListGalleryController extends ChangeNotifier {
  ListGalleryUseCase listGalleryUseCase = ListGalleryUseCase();
  LocalRepository localRepository = LocalRepository();
  Gallery? _gallery;
  List<String> _listImageSmall = [];
  List<String> _listImageLarge = [];
  static String? _currentPhoto;

  Gallery? get gallery => _gallery;
  List<String>? get listImageSmall => _listImageSmall;
  List<String>? get listImageLarge => _listImageLarge;
  static String? get currentPhoto => _currentPhoto;

  ListGalleryController() {
    getGallery();
    getListImage(_listImageSmall, 'small');
    getListImage(_listImageLarge, 'large');
    notifyListeners();
  }

  void getCurrentPhoto(int index) {
    _currentPhoto = _listImageLarge[index];
    notifyListeners();
  }

  void getGallery() async {
    listGalleryUseCase.call();
    final decodedGallery = await json
        .decode(await localRepository.getLocalStorageString('gallery') ?? '');
    Gallery fromGallery = galleryFromJson(decodedGallery);
    _gallery = fromGallery;
    notifyListeners();
    //print(_gallery!.photos);
  }

  void getListImage(List<String> list, String size) async {
    final decodedGallery = await json
        .decode(await localRepository.getLocalStorageString('gallery') ?? '');
    Gallery fromGallery = galleryFromJson(decodedGallery);
    fromGallery.photos!.forEach((element) {
      if(size == 'small'){
        list.add((element.src?.medium) ?? '');
      } else{
        list.add((element.src?.large2X) ?? '');
      }
    });
    notifyListeners();
    //print(_listImageSmall);
  }
}
