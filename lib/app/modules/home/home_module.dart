import 'package:dio/dio.dart';
import 'package:meajuda/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meajuda/app/modules/home/home_page.dart';

import 'shared/repositories/curso_repository.dart';
import 'shared/utils/constants.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<CursoRepository>())),
        Bind((i) => CursoRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
