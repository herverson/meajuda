import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';
import 'pages/course_page.dart';
import 'shared/utils/constants.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Bem-vindo',
                        style: GoogleFonts.montserrat(
                          fontSize: 44,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Campus Russas',
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                color: const Color(0x7cdbf1ff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Icon(Ionicons.ios_arrow_down),
                        ),
                        underline: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Observer(builder: (_) {
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
                  var cursos = controller.cursos.value;
                  return Container(
                    height: 500,
                    padding: const EdgeInsets.only(left: 32),
                    child: Swiper(
                      itemCount: cursos.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeSize: 20, space: 8),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => DetailPage(
                                  curso: cursos[index],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 100),
                                    Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 50),
                                            Text(
                                              cursos[index].nome,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 30,
                                                color: const Color(0xff47455f),
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 50),
                                            Text(
                                              'Exatas',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 23,
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 32),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Saiba mais',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 18,
                                                    color: secondaryTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: secondaryTextColor,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Hero(
                              //   tag: cursos[index].id,
                              //   child: Image.network(
                              //       "https://assets-ouch.icons8.com/thumb/428/88b57de6-38b6-4086-887e-93f181f27ec7.png"),
                              // ),
                              Positioned(
                                right: 24,
                                bottom: 60,
                                child: Text(
                                  cursos[index].qtdSesmestres.toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 150,
                                    color: primaryTextColor.withOpacity(0.08),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Ionicons.md_apps),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Ionicons.ios_search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Feather.user),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
