import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_naver_app/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = 'today';

  /// Get today's webtoons
  /// @return List<WebtoonModel>
  /// @throws Error if response status code is not 200
  Future<List<WebtoonModel>> getTodaysToons() async {
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
}
