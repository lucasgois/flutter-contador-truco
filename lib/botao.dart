import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao(
    this.texto,
    this.funcao, {
    this.width = 160,
    this.height = 80,
    Key? key,
  }) : super(key: key);

  final String texto;
  final Function() funcao;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: funcao,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: width,
            height: height,
            child: FittedBox(
              child: Text(texto),
            ),
          ),
        ),
      ),
    );
  }
}
