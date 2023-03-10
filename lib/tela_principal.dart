import 'package:contador_truco/botao.dart';
import 'package:contador_truco/regras/jogador.dart';
import 'package:contador_truco/regras/partida.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final Partida _partida = Partida();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            componente(_partida.nos),
            Botao(
              'Zerar partida',
              recomecarPartida,
              width: 350,
              height: 75,
            ),
            Botao(
              'Zerar tudo',
              recomecarTudo,
              width: 350,
              height: 75,
            ),
            componente(_partida.eles),
          ],
        ),
      ),
    );
  }

  void recomecarPartida() {
    setState(() {
      _partida.recomecarPartida();
    });
  }

  void recomecarTudo() {
    setState(() {
      _partida.recomecarTudo();
    });
  }

  Widget componente(Jogador jogador) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${jogador.nome}: ${jogador.pontos}', style: const TextStyle(fontSize: 50)),
        Row(
          children: [
            Botao('+1', () => add(jogador, 1)),
            Botao('-1', () => add(jogador, -1)),
          ],
        ),
        Botao('Truco', () => setState(() => _partida.add(jogador, 3))),
        Text('Vitórias: ${jogador.vitorias}', style: const TextStyle(fontSize: 50)),
      ],
    );
  }

  void add(Jogador jogador, int pontos) => setState(() => _partida.add(jogador, pontos));
}
