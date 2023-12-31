import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hey, Jade',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.5),
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Total Balance',
              style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '\$5 194 482',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 48,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  text: 'Transfer',
                  bgColor: Colors.amber,
                  textColor: Colors.black,
                ),
                Button(
                  text: 'Request',
                  bgColor: Colors.blueGrey,
                  textColor: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Wallets',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CurrencyCard(
              name: 'Euro',
              code: 'EUR',
              amount: '6 428',
              icon: Icons.euro_rounded,
              isInverted: true,
              index: 0,
            ),
            const CurrencyCard(
              name: 'Bitcoing',
              code: 'BTC',
              amount: '24',
              icon: Icons.currency_bitcoin_rounded,
              isInverted: false,
              index: 1,
            ),
            const CurrencyCard(
              name: 'Pound',
              code: 'GBP',
              amount: '1 243',
              icon: Icons.currency_pound_rounded,
              isInverted: true,
              index: 2,
            )
          ],
        ),
      ),
    ));
  }
}
