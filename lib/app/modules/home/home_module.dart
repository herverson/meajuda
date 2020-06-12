import 'package:dio/dio.dart';
import '../../modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../modules/home/home_page.dart';

import 'components/course_page.dart';
import 'components/disciplina_page.dart';
import '../../shared/repositories/curso_repository.dart';
class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<CursoRepository>())),
        Bind((i) => CursoRepository(i.get<Dio>())),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/curso', child: (_, args) => DetailPage(curso: args.data)),
        Router('/disciplina', child: (_, args) => DisciplinaPage(disciplina: args.data)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
