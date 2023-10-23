import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];

  void onClicked() {
    // a function telling the state to update
    setState(() {
      numbers.add(numbers.length);
      print(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE0E0E0),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Click Count',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Text(
            '${numbers.length}',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.blue,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: onClicked,
            icon: const Icon(Icons.add_box_rounded),
            color: Colors.blue,
            iconSize: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            ...numbers
                .map((number) => Text(
                      '$number',
                      style: const TextStyle(fontSize: 20),
                    ))
                .toList(),
            const SizedBox(
              width: 4,
            )
          ])
        ])),
      ),
    );
  }
}
