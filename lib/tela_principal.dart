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
  double width = 100;

  @override
  Widget build(BuildContext context) {
    Axis direction;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      direction = Axis.vertical;
      width = MediaQuery.of(context).size.width * 0.25;
    } else {
      direction = Axis.horizontal;
      width = MediaQuery.of(context).size.width * 0.15;
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Center(
          child: Flex(
            direction: direction,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              componente(_partida.nos),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botao(
                    'Zerar partida',
                    recomecarPartida,
                    width: width,
                    height: 75,
                  ),
                  Botao(
                    'Zerar tudo',
                    recomecarTudo,
                    width: width,
                    height: 75,
                  ),
                ],
              ),
              componente(_partida.eles),
            ],
          ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Botao('+1', () => add(jogador, 1), width: width),
            Botao('-1', () => add(jogador, -1), width: width),
          ],
        ),
        Botao('Truco', () => add(jogador, 3)),
        Text('Vitórias: ${jogador.vitorias}', style: const TextStyle(fontSize: 50)),
      ],
    );
  }

  void add(Jogador jogador, int pontos) => setState(() => _partida.add(jogador, pontos));
}
