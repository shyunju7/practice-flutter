import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

// widget
// widget을 합치는 방식으로 동작

// flutter sdk에 있는 3개의 core widget 중에 하나를 상속받아야함
// StatelessWidget - 가장 기본적인 위젯
// root - 앱 실행시 가장 먼저 뜸
class App extends StatelessWidget {
  const App({super.key});

  // 모든 widget은 build 메서드를 구현해야함
  // build 메서드는 widget UI를 만드는 일을 함
  // widget을 리턴함

  @override
  Widget build(BuildContext context) {
    // 기본 설정 테마(material, cupertino, custom)
    // scaffold는 화면의 구성 및 구조에 관한 것들을 가지고 있는 위젯

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "\$5 194 382",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // div
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: "Request",
                      bgColor: Color(0xFF1F2023),
                      textColor: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: "Euro",
                  code: "EUR",
                  amount: "6 428",
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  order: 1,
                ),
                const CurrencyCard(
                  name: "Bitcoin",
                  code: "BTC",
                  amount: "8 728",
                  icon: Icons.currency_bitcoin_rounded,
                  isInverted: true,
                  order: 2,
                ),
                const CurrencyCard(
                  name: "Dollar",
                  code: "USD",
                  amount: "428",
                  icon: Icons.attach_money_rounded,
                  isInverted: false,
                  order: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
