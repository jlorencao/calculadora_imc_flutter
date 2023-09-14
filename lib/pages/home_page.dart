import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double altura = 0;
  double peso = 0;
  double imc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora IMC"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Altura: $altura "),
                  Text("Peso: $peso"),
                  Text("IMC: $imc"),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("ADICIONA NOVO IMC"),
              ),
            ],
          ),
        ));
  }
}
