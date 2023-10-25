import 'package:flutter/material.dart';
import 'package:webtoon_naver_app/models/webtoon_model.dart';
import 'package:webtoon_naver_app/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //elegant way to fetch data from api in stateless widget
  final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            '오늘의 웹툰',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, idx) {
                  final webtoon = snapshot.data![idx];
                  print(webtoon.title);
                  return Text(webtoon.title);
                },
                separatorBuilder: (context, idx) => const SizedBox(
                  width: 16,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
