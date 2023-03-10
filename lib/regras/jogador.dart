class Jogador {
  Jogador(this.nome);

  final String nome;
  int pontos = 0;
  int vitorias = 0;

  void limpar() {
    pontos = 0;
    vitorias = 0;
  }
}
