import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../shared/models/disciplina.dart';
import '../../../shared/utils/constants.dart';

import '../home_controller.dart';

class DisciplinaPage extends StatefulWidget {
  final Disciplinas disciplina;
  const DisciplinaPage({Key key, this.disciplina}) : super(key: key);
  @override
  _DisciplinaPageState createState() => _DisciplinaPageState();
}

class _DisciplinaPageState extends State<DisciplinaPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.disciplina.nome,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Modular.to.pop(),
        ),
        backgroundColor: navigationColor,
      ),
      body: SafeArea(
        child: Observer(builder: (_) {
          if (controller.docs.error != null) {
            return Center(
              child: RaisedButton(
                onPressed: () {
                  controller.fetchDocs(widget.disciplina.id);
                },
                child: Text('Repetir'),
              ),
            );
          }

          if (controller.docs.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.docs.value.isEmpty) {
            return Center(
              child: Column(
                children: <Widget>[
                  Icon(MaterialCommunityIcons.file_pdf, size: 80.0,),
                  Text('Nenhum arquivo nessa disciplina!', style: TextStyle(fontSize: 18.0),),
                ],
              ),
            );
          }
          var docs = controller.docs.value;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: Text(docs[index].titulo),
                  leading: Icon(MaterialCommunityIcons.file_pdf),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
