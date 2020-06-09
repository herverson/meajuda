import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.cursos.error != null) {
          return Center(
            child: RaisedButton(
              onPressed: () {
                controller.fetchCursos();
              },
              child: Text('Repetir'),
            ),
          );
        }

        if (controller.cursos.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var list = controller.cursos.value;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index].nome),
            );
          },
        );
      }),
    );
  }
}
