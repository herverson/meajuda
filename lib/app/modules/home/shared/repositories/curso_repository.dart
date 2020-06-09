import 'package:dio/dio.dart';
import 'package:meajuda/app/modules/home/shared/models/curso.dart';

class CursoRepository {
  final Dio dio;

  CursoRepository(this.dio);

  Future<List<Curso>> getAllCursos() async {
    var response = await dio.get('curso/listar');
    List<Curso> cursos = [];
    print(response.data.toString());
    for (var json in (response.data as List)) {
      Curso curso = Curso.fromJson(json);
      cursos.add(curso);
    }
    return cursos;
  }
}