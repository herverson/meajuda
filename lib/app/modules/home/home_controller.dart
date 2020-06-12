import '../../shared/models/documento.dart';

import '../../shared/models/curso.dart';
import '../../shared/repositories/curso_repository.dart';
import 'package:mobx/mobx.dart';


part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CursoRepository repository;

  _HomeControllerBase(this.repository) {
    fetchCursos();
  }

  @observable
  ObservableFuture<List<Curso>> cursos;

  @observable
  ObservableFuture<List<Documento>> docs;
  
  @action
  fetchCursos() {
    cursos = repository.getAllCursos().asObservable();
  }

  @action
  fetchDocs(int id) {
    docs = repository.getAllDocumentos(id).asObservable();
  }
}
