import 'dart:ffi';

import 'package:flutter/material.dart';

import 'styles/font.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ma premiere app flutter'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 10;

  void _incrementCounter() {
    setState(() {
      if (-- counter < 0) {
        counter = 0;
      }
    });
  }

  void restart() {
    counter = 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: counter > 0 ?
          Counter(counter: counter) :
          PlayAgain(onPressed: () {
            setState(() {
              counter = 10;
            });
          })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final int counter;
  const Counter({super.key, required this.counter});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  _CounterState();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("You have ", style: kFontHeaderStyle),
          Text("${widget.counter}", style: kFontHeaderStyle),
          const Text(" remaining clicks.", style: kFontHeaderStyle)
        ]
    );
  }
}

class PlayAgain extends StatelessWidget {
  final void Function() onPressed;

  const PlayAgain({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("You lost 😢😢", style: kFontHeaderStyle),
        Image.asset("assets/images/chat_qui_dort.jpg"),
        FilledButton(onPressed: onPressed, child: const Text("Restart"))
      ],
    );
  }
}
