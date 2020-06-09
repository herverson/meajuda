import 'package:mobx/mobx.dart';

import 'shared/models/curso.dart';
import 'shared/repositories/curso_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CursoRepository repository;

  _HomeControllerBase(this.repository) {
    fetchCursos();
  }

  @observable
  ObservableFuture<List<Curso>> cursos;
  
  @action
  fetchCursos() {
    cursos = repository.getAllCursos().asObservable();
  }
}
