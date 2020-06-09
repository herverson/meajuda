// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$cursosAtom = Atom(name: '_HomeControllerBase.cursos');

  @override
  ObservableFuture<List<Curso>> get cursos {
    _$cursosAtom.reportRead();
    return super.cursos;
  }

  @override
  set cursos(ObservableFuture<List<Curso>> value) {
    _$cursosAtom.reportWrite(value, super.cursos, () {
      super.cursos = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic fetchCursos() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchCursos');
    try {
      return super.fetchCursos();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cursos: ${cursos}
    ''';
  }
}
