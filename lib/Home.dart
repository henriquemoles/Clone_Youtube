import 'package:youtube_clone/CustomSearchDelegate.dart';
import 'package:youtube_clone/telas/Adicionar.dart';
import 'package:youtube_clone/telas/Biblioteca.dart';
import 'package:youtube_clone/telas/EmAlta.dart';
import 'package:youtube_clone/telas/Inicio.dart';
import 'package:youtube_clone/telas/Inscricao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "";
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Adicionar(),
      Inscricao(),
      Biblioteca(),

    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: -12.00,
        leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.youtube,color: Colors.red,size: 28,),
            onPressed:(){
            print("teste youtube");
          }
      ),
        title: Text("YouTube", textAlign: TextAlign.left,style: GoogleFonts.pathwayGothicOne(fontWeight: FontWeight.w600, fontSize: 26,color: Colors.black,letterSpacing: -1, height: 1.1),
        ),
        actions: <Widget> [
          /*IconButton(
              icon: Icon(Icons.cast_connected_sharp,color: Colors.black54),
              onPressed:(){
                print("teste videocam");
              }
          ),
          IconButton(
              icon: Icon(Icons.notifications_none_outlined,color: Colors.black54),
              onPressed:(){
                print("teste videocam");
              }
          ),

          IconButton(
              icon: Icon(Icons.account_circle,color: Colors.black54),
              onPressed:(){
                print("teste conta");
              }
          ),*/
          IconButton(
              icon: Icon(Icons.search,color: Colors.black54),
              onPressed:() async {
                String res = await showSearch(context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res;
                });
              }
          ),
        ],
      ) ,
      body: Container(
        padding:EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyle(color: Colors.black),
        fixedColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color:Colors.black54),
            label: 'início',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot, color:Colors.black54),
            label: 'Em Alta',
          ),
         /* BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_sharp, color:Colors.black54,size: 30,),
            label: 'Adicionar',
               ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined, color:Colors.black54),
            label: 'Inscrições',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined, color:Colors.black54),
            label: 'Bilbioteca',
          ),
        ],
      ),
    );
  }
}
