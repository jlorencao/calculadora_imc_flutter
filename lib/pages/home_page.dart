import 'package:calculadora_imc_app/data/imc_class.dart';
import 'package:calculadora_imc_app/data/imc_repository.dart';
import 'package:calculadora_imc_app/widgets/list_view.dart';
import 'package:flutter/material.dart';

import 'imc_input_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imcRepository = IMCRepository();
  var _imcList = <Imc>[];
  var result;

  @override
  void initState() {
    super.initState();
    obterListaIMC();
  }

  List<Imc> obterListaIMC() {
    _imcList = imcRepository.getIMCList();
    return _imcList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Calculadora IMC",
          ),
          backgroundColor: Colors.blue.shade200,
        ),
        floatingActionButton: TextButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
          onPressed: () async {
            result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const IMCInputPage()));
            setState(() {
              _imcList.add(result);
            });

            /* showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(content: const IMCPage(), actions: [
                      TextButton(
                        onPressed: () {
                          imcRepository.setItemImcList(nome, peso, altura);
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Text("Salva"),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancela"))
                    ]);
                  });*/
          },
          child: const Text(
            "ADICIONA NOVO IMC",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListViewCustom(imcList: _imcList),
      ),
    );
  }
}
