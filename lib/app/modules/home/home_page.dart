import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/utils/constants.dart';
import 'home_controller.dart';

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
            stops: [0.3, 0.7],
          ),
        ),
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
                          activeSize: 20,
                          space: 8,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Modular.to
                                .pushNamed('/curso', arguments: cursos[index]);
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(26.0),
          topLeft: Radius.circular(26.0),
        ),
        child: BottomNavyBar(
          backgroundColor: navigationColor,
          selectedIndex: _currentIndex,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
                icon: Icon(MaterialCommunityIcons.view_grid),
                title: Text('Início'),
                inactiveColor: Colors.black,
                activeColor: Colors.white),
            BottomNavyBarItem(
                icon: Icon(Ionicons.ios_search),
                title: Text('Pesquisar'),
                inactiveColor: Colors.black,
                activeColor: Colors.white),
            BottomNavyBarItem(
                icon: Icon(Feather.user),
                inactiveColor: Colors.black,
                title: Text('Usuário'),
                activeColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
