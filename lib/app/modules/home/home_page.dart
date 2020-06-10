import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';
import 'pages/courses_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Me Ajuda?',
          style: GoogleFonts.montserrat(
            color: Colors.grey,
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.grey,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            height: 100.0,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.05),
            padding: EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '121k',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.0, color: Colors.red),
                    ),
                    Text(
                      'Exercícios',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '152',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.0, color: Colors.red),
                    ),
                    Text(
                      'Livros',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '455',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.0, color: Colors.red),
                    ),
                    Text(
                      'Provas',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFF33426F),
            isScrollable: true,
            unselectedLabelColor: Color(0xFFB6BDC7),
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Cursos',
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                  ),
                ),
              ),
              // Tab(
              //   child: Text(
              //     'My Wishlist',
              //     style: TextStyle(
              //       fontFamily: 'Montserrat',
              //       fontSize: 20.0,
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  CursosPage(),
                ],
              ))
        ],
      ),
    );
  }
}
