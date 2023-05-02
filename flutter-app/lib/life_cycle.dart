import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// React 보다 State를 자주 사용하지 않음
// 더 좋은 위젯을 이용해서 처리할 수 있음
class _AppState extends State<App> {
  bool isShowTitle = true;

  void toggleTitle() {
    setState(() {
      isShowTitle = !isShowTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.purple,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.purple.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isShowTitle ? const MyLargeTitle() : const Text("Nothing"),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

// 부모 요소에 의존하는 데이터를 초기화할 때 initState를 사용함
// 또한, API를 구독하고 싶을 때 사용
// 오직 단 한번 호출됨
// initState 호출 후 build가 호출됨
//
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState()...");
  }

  // 위젯이 스크린에서 제거될 때 호출되는 메서드(취소할 떄 )
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose()...");
  }

  @override
  Widget build(BuildContext context) {
    print("build()...");
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}

// Flutter는 앱의 모든 스타일을 한 곳에서 지정할 수 있는 기능을 제공해줌
// 색상, 크기, 글자 굵기 한 곳에서 지정
// 복붙에서 사용할 필요가 없음

// Flutter Rendering Tree 이해하기

// context에는 widget 트리에 대한 정보가 담겨있음
// 매우 먼 요소의 데이터를 가져올 수 있기 때문에 유용(부모, 조부모 등 접근할 수 있음)

// !와 ? 차이
// !는 있다고 확신한다 : Theme.of(context).textTheme.titleLarge!.color,
// ?는 없을 수도 있다 : Theme.of(context).textTheme.titleLarge?.color,


// statefulWidget은 라이프 사이클을 가지고 있음
// 여러 시점별로 존재하지만 가장 중요한 건 아래 3가지
// initState - 변수를 초기화하고, API를 구독할 수 있게 해준다.
// build - 위젯에서 UI를 만든다.
// dispose - 위젯트리에서 제거될 때 실행한다. 이벤트 리스너 같은 것들의 구독을 취소할 때