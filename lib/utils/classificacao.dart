class Classificacao {
  static String classificar(double imc) {
    String classificacao = "";
    if (imc < 16) {
      classificacao = "Magreza grave";
    } else if (imc < 17) {
      classificacao = "Magreza moderada";
    } else if (imc < 18.5) {
      classificacao = "Magreza leve";
    } else if (imc < 25) {
      classificacao = "Saudável";
    } else if (imc < 30) {
      classificacao = "Sobrepeso";
    } else if (imc < 35) {
      classificacao = "Obesidade Grau I";
    } else if (imc < 40) {
      classificacao = "Obesidade Grau II (severa)";
    } else if (imc >= 40) {
      classificacao = "Obesidade Grau III (mórbida)";
    }
    return classificacao;
  }
}
