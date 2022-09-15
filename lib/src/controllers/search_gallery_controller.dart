import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:photos_fake/src/data/uses_cases/uses_cases.dart';
import 'package:photos_fake/src/utils/local_repository.dart';

import '../data/models/models.dart';

class SearchGalleryController extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SearchGalleryUseCase searchGalleryUseCase = SearchGalleryUseCase();
  LocalRepository localRepository = LocalRepository();
  TextEditingController textController = TextEditingController();
  Gallery? _gallery;
  List<String> _listImageSmall = [];
  List<String> _listImageLarge = [];
  static String? _currentPhoto;

  Gallery? get gallery => _gallery;
  List<String> get listImageSmall => _listImageSmall;
  List<String> get listImageLarge => _listImageLarge;
  static String? get currentPhoto => _currentPhoto;
  GlobalKey<FormState> get formKey => _formKey;

  /* SearchGalleryController() {
    getGalleryImageLarge(textController.text);
  } */

  void getCurrentPhoto(int index) {
    _currentPhoto = _listImageLarge[index];
    notifyListeners();
  }

  void getGalleryImageLarge(String value) async {
    _listImageSmall = [];
    _listImageLarge = [];
    Gallery gallery =
        galleryFromJson(await searchGalleryUseCase.call(params: value));
    gallery.photos!.forEach((photo) {
      _listImageSmall.add((photo.src?.medium) ?? '');
      _listImageLarge.add((photo.src?.large2X) ?? '');
    });
    notifyListeners();
  }

  Future<Gallery> getGallery(String value) async {
    Gallery gallery =
        galleryFromJson(await searchGalleryUseCase.call(params: value));
    //print(response.photos);
    notifyListeners();
    return gallery;
  }

  Future<List<Photo>?> getListImage(String value) async {
    Gallery fromGallery =
        galleryFromJson(await searchGalleryUseCase.call(params: value));
    notifyListeners();
    return fromGallery.photos;
    //print(_listImageSmall);
  }
}
