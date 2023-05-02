import 'package:flutter/material.dart';
import 'package:nomad_toonflix/models/webtoon.dart';
import 'package:nomad_toonflix/services/api_service.dart';
import 'package:nomad_toonflix/widget/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
        elevation: 1,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // snapshot을 이용하면 Future에 상태를 알 수 있음
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: handleMakeWebtoons(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView handleMakeWebtoons(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    // 최적화된 ListView - 사용자가 보고 있는 화면의 콘텐츠만 볼 수 있게
    // 스크롤하면 다음 아이템을 만들어줌(한번에 로드하지 않음)
    // itemBuilder
    // ListView.builder
    // ListView.separated
    // 최적화가 되지 않은 방법
    // return ListView(
    //   children: [
    //     for (var webtoon in snapshot.data!) Text(webtoon.title),
    //   ],
    // );
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        print(webtoon);
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}

// FutureBuilder에 builder는 UI를 그려주는 함수
