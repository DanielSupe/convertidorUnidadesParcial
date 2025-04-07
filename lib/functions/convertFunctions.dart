double convertirCelsiusRankine(double valor, String from) {
  if (from == "Celsius") {
    return valor * 9 / 5 + 491.67;
  } else {
    return (valor - 491.67) * 5 / 9;
  }
}

double convertirAnosLuzAU(double valor, String from) {
  const double anosLuzEnAU = 63241.1;
  if (from == "Años luz") {
    return valor * anosLuzEnAU;
  } else {
    return valor / anosLuzEnAU;
  }
}

double convertirMetroMillaNautica(double valor, String from) {
  const double metroEnMillaNautica = 0.000539957;
  if (from == "Metro") {
    return valor * metroEnMillaNautica;
  } else {
    return valor / metroEnMillaNautica;
  }
}