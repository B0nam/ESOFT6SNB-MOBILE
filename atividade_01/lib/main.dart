import 'package:flutter/material.dart';

void main() {
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade01',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CardAtividade(),
          CardAtividade(),
          CardAtividade(),
          CardAtividade()
        ],
      ),
    );
  }
}

class CardAtividade extends StatelessWidget {
  const CardAtividade({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        child: Center(
          child: Text('Card Teste'),
        )
      )
    );
  }
}