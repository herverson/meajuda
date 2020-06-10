import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meajuda/app/modules/home/home_controller.dart';

class CursosPage extends StatefulWidget {
  @override
  _CursosPageState createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<HomeController>();
    return Container(
      child: Observer(builder: (_) {
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
        return GridView.count(
            crossAxisCount: 2,
            primary: false,
            padding: EdgeInsets.all(10.0),
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            shrinkWrap: true,
            children: List.generate(list.length, (index) {
              return _buildCard(
                  list[index].nome,
                  list[index].qtdSesmestres.toString(),
                  '09-06-14',
                  '5',
                  "https://assets-ouch.icons8.com/thumb/428/88b57de6-38b6-4086-887e-93f181f27ec7.png");
            }));
      }),
    );
  }

  _buildCard(String nomeCurso, String type, String date, String rating,
      String imgPath) {
    return Container(
      padding: EdgeInsets.all(7.0),
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 3.0,
            spreadRadius: 3.0,
            color: Colors.grey.withOpacity(0.2))
      ]),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 140.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imgPath), fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 60.0,
                  left: 100.0,
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        color: Colors.white),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 4.0),
                        Text(
                          rating,
                          style: TextStyle(color: Colors.red, fontSize: 11.0),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 11.0,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            nomeCurso,
            style: GoogleFonts.montserrat(
              color: Color(0xFF233467),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                type,
                style:
                    GoogleFonts.montserrat(color: Colors.grey, fontSize: 11.0),
              ),
              Text(
                date,
                style:
                    GoogleFonts.montserrat(color: Colors.grey, fontSize: 11.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
