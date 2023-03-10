import 'dart:math';

import 'package:contador_truco/regras/jogador.dart';

class Partida {
  final Jogador nos = Jogador('Nós');
  final Jogador eles = Jogador('Eles');

  void recomecarPartida() {
    nos.pontos = 0;
    eles.pontos = 0;
  }

  void recomecarTudo() {
    nos.limpar();
    eles.limpar();
  }

  void add(Jogador jogador, int pontos) {
    jogador.pontos = max(0, jogador.pontos + pontos);

    if (jogador.pontos >= 12) {
      _vitoria(jogador);
    }
  }

  void _vitoria(Jogador jogador) {
    jogador.vitorias++;

    recomecarPartida();
  }
}
