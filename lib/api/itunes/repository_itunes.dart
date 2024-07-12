import 'package:dio/dio.dart';
import 'package:flutter_itunes/api/itunes/interface_repository_itunes.dart';
import 'package:flutter_itunes/config/config.dart';
import 'package:flutter_itunes/model/song/song.dart';
import 'dart:convert';

class ItunesRepository implements IItunesRepository {
  ItunesRepository();

  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.apiEndPoint,
    contentType: Headers.jsonContentType,
  ));

  @override
  Future<List<Song>> fetch() async {
    final response = await dio.get(
        "/search?term=${AppConfig.singer}&limit=${AppConfig.limit}&media=music");

    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }

    final data = json.decode(response.data);

    return data['results'].map<Song>((json) => Song.fromJson(json)).toList();
  }
}
