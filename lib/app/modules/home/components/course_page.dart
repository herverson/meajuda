import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meajuda/app/modules/home/home_controller.dart';
import 'package:meajuda/app/shared/models/disciplina.dart';
import '../../../shared/models/curso.dart';
import '../../../shared/utils/constants.dart';

class DetailPage extends StatelessWidget {
  final Curso curso;

  const DetailPage({Key key, this.curso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // SizedBox(height: 300),
                        Text(
                          curso.nome,
                          style: GoogleFonts.montserrat(
                            fontSize: 50,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Quantidade de semestres ${curso.qtdSesmestres}',
                          style: GoogleFonts.montserrat(
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          curso.descricao ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Disciplinas',
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Wrap(
                        spacing: 0.0, // gap between adjacent chips
                        runSpacing: 0.0, // gap between lines
                        children: List.generate(
                          curso.disciplinas.length,
                          (index) => chipDesign(
                            curso.disciplinas[index].nome,
                            Color(0xFFE4979E),
                            curso.disciplinas[index],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget chipDesign(String label, Color color, Disciplinas disciplinas) =>
      Container(
        margin: EdgeInsets.only(right: 4),
        child: GestureDetector(
          onTap: () {
            Modular.get<HomeController>().fetchDocs(disciplinas.id);
            Modular.to.pushNamed('/disciplina', arguments: disciplinas);
          },
          child: Chip(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            label: Text(
              label,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
              ),
            ),
            backgroundColor: color,
            elevation: 4,
            shadowColor: Colors.grey[50],
            padding: EdgeInsets.all(4),
          ),
        ),
      );
}
