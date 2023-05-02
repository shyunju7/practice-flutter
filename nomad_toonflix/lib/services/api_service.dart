import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nomad_toonflix/models/webtoon.dart';
import 'package:nomad_toonflix/models/webtoon_detail_model.dart';
import 'package:nomad_toonflix/models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  // Future 타입은 당장 완료할 수 없는 미래의 작업을 의미
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    // http 설치 flutter pub add http
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url); // Future<Response>
    if (response.statusCode == 200) {
      // 응답받은 String 데이터를 Json으로 변환
      final List<dynamic> webtoons = jsonDecode(response.body); // json Decoder

      print("webtoons ?? $webtoons");

      // Json 데이터를 Model로 변환해서 추가
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  // webtoon 상세 정보를 가져올 메서드
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  // episode 가져올 메서드
  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
