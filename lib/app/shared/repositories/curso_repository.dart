import 'package:dio/dio.dart';
import 'package:meajuda/app/shared/models/documento.dart';
import 'package:meajuda/app/shared/utils/constants.dart';
import '../models/curso.dart';

class CursoRepository {
  final Dio dio;

  CursoRepository(this.dio);

  Future<List<Curso>> getAllCursos() async {
    var response = await dio.get('${URL_CURSO}curso/listar');
    List<Curso> cursos = [];
    for (var json in (response.data as List)) {
      Curso curso = Curso.fromJson(json);
      cursos.add(curso);
    }
    return cursos;
  }

  Future<List<Documento>> getAllDocumentos(int id) async {
    var response = await dio.get('${URL_DOCUM}listar/disciplina/${id.toString()}');
    List<Documento> docs = [];
    for (var json in (response.data as List)) {
      Documento doc = Documento.fromJson(json);
      docs.add(doc);
    }
    return docs;
  }
}