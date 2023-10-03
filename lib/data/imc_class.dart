import 'package:flutter/cupertino.dart';

class Imc {
  String id = UniqueKey().toString();
  String nome = "";
  final double peso;
  final double altura;
  final double imc;
  final String classificacaoIMC;

  Imc(
      {required this.nome,
      required this.altura,
      required this.peso,
      required this.imc,
      required this.classificacaoIMC});
}
