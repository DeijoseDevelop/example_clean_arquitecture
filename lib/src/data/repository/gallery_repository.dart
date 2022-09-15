import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GalleryRepository {
  final _baseUrl = 'https://api.pexels.com/v1/';
  final _token = '563492ad6f917000010000017201ec2a3e1441f3a80f5d84f9f39004';

  Future<http.Response> getGallery() async {
    final urlGallery = Uri.parse('${_baseUrl}curated?page=1&per_page=80');
    return await http.get(urlGallery, headers: {
      'Authorization': _token,
      'Content-Type': 'application/json',
    });
  }

  Future<http.Response> searchGallery(String value) async {
    final urlGallery = Uri.parse('${_baseUrl}search?query=$value&page=1&per_page=80');
    return await http.get(urlGallery, headers: {
      'Authorization': _token,
      'Content-Type': 'application/json',
    });
  }
}
