import 'package:flutter/material.dart';

import '../data/imc_repository.dart';

class IMCInputPage extends StatefulWidget {
  const IMCInputPage({super.key});

  @override
  State<IMCInputPage> createState() => _IMCInputPageState();
}

class _IMCInputPageState extends State<IMCInputPage> {
  String? nome = "";
  double? altura;
  double? peso;

  var imcRepository = IMCRepository();
  final _formKey = GlobalKey<FormState>();

  var imc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Insira os Dados"),
          backgroundColor: Colors.blue.shade200,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          labelText: "Nome",
                          contentPadding: EdgeInsets.only(bottom: 0)),
                      onChanged: (value) {
                        nome = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigratorio';
                        }
                      }),
                  const SizedBox(height: 15),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Peso em KG",
                          contentPadding: EdgeInsets.only(bottom: 0)),
                      onChanged: (value) {
                        peso = double.parse(value);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            double.parse(value) <= 0) {
                          return 'Digite um valor valido';
                        }
                      }),
                  const SizedBox(height: 15),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Altura em Metros",
                          contentPadding: EdgeInsets.only(bottom: 0)),
                      onChanged: (value) {
                        altura = double.parse(value);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            double.parse(value) <= 0) {
                          return 'Digite um valor valido';
                        }
                      }),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () {
                            if (_formKey.currentState!.validate() == true) {
                              imc = imcRepository.setImc(nome!, peso!, altura!);
                              Navigator.pop(context, imc);
                              setState(() {});
                            }
                          },
                          child: const Text(
                            "Salva",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancela",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
