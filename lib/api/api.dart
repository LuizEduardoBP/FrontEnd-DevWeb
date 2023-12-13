import 'package:dio/dio.dart';
import 'package:front/models/anuncios.dart';

class Api {
  // Configurar o Dio com a base URL da API
  final dio = Dio();

  // Método para buscar todas as tarefas
  Future<List<Anuncios>> buscaAnuncios() async {
    try {
      final response = await dio.get('https://localhost:8080/anuncios');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<Anuncios> anuncios = data.map((json) => Anuncios.fromJson(json)).toList();
        // print(anuncios);
        return anuncios;
      } else {
        throw Exception('Erro na solicitação GET');
      }
    } catch (e) {
      throw Exception('Erro de rede: $e');
    }
  }
}
