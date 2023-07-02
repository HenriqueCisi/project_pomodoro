import 'package:flutter/material.dart';
import 'package:project_pomodoro/pages/pomodoro.dart';
import 'package:project_pomodoro/store/counter_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const Pomodoro(),
    );
  }
}

final store = CounterStore();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Observer(builder: (_) =>               Text(
                '${store.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: store.add,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
