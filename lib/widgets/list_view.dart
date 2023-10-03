import 'package:flutter/material.dart';

import '../data/imc_class.dart';

class ListViewCustom extends StatefulWidget {
  final List<Imc> imcList;

  const ListViewCustom({super.key, required this.imcList});

  @override
  State<ListViewCustom> createState() => _ListViewCustomState();
}

class _ListViewCustomState extends State<ListViewCustom> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.imcList.length,
        itemBuilder: (BuildContext bc, int index) {
          var imc = widget.imcList[index];
          return Column(children: [
            Text(imc.nome),
            Text("Classificaçao: ${imc.classificacaoIMC}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Altura: ${imc.altura} "),
                Text("Peso: ${imc.peso} "),
                Text("IMC: ${imc.imc}")
              ],
            )
          ]);
        });
  }
}
