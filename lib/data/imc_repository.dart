import 'dart:math';

import 'imc_class.dart';

class IMCRepository {
  List<Imc> imcList = [];

  Imc setImc(String nome, double peso, double altura) {
    var imcCalculado = IMCCalculo(peso, altura);
    var imc = Imc(
        nome: nome,
        peso: peso,
        altura: altura,
        imc: imcCalculado,
        classificacaoIMC: classificaIMC(imcCalculado));

    return imc;
  }

  void setImcToList(Imc imc) {
    imcList.add(imc);
  }

  List<Imc> getIMCList() {
    return imcList;
  }

  double IMCCalculo(double peso, double altura) {
    double imcCalculo = peso / pow(altura, 2);

    return imcCalculo;
  }

  String classificaIMC(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      return "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      return "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      return "Saudavel";
    } else if (imc >= 25 && imc < 30) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade Grau II (severa)";
    } else if (imc >= 40) {
      return "Obesidade Grau III (morbida)";
    } else {
      return "Dados insuficientes para calculo do IMC";
    }
  }
}
