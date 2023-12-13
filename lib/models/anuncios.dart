class Anuncios {
  late String titulo;
  late String anunciante;
  late String endereco;
  late List<String> fotos;
  late double valor;
  late List<String> categorias;

  Anuncios({
    required this.titulo,
    required this.anunciante,
    required this.endereco,
    required this.fotos,
    required this.valor,
    required this.categorias,
  });

  factory Anuncios.fromJson(Map<String, dynamic> parsedJson) {
    return Anuncios(
      titulo: parsedJson['titulo'],
      anunciante: parsedJson['anunciante'],
      endereco: parsedJson['endereco'],
      fotos: parsedJson['fotos'],
      valor: parsedJson['valor'],
      categorias: parsedJson['categorias'],
    );
  }
}
