import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_naver_app/models/webtoon_detail_model.dart';
import 'package:webtoon_naver_app/models/webtoon_episode_model.dart';
import 'package:webtoon_naver_app/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  /// Get today's webtoons
  /// @return List<WebtoonModel>
  /// @throws Error if response status code is not 200
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    // construct url
    final url = Uri.parse('$baseUrl/$today');
    // fetch data
    final response = await http.get(url);
    // check the response status code
    if (response.statusCode == 200) {
      // convert json to dart object
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (final webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }

    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    // fetch data
    final response = await http.get(url);
    // check the response status code
    if (response.statusCode == 200) {
      // convert json to dart object
      final dynamic webtoonDetail = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoonDetail);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    // fetch data
    final response = await http.get(url);
    // check the response status code
    if (response.statusCode == 200) {
      // convert json to dart object
      final dynamic episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
