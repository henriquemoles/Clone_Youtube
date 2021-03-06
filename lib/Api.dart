import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = //sua chave do youtube
const ID_CANAL = "UCplT2lzN6MHlVHHLt6so39A";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

 Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response response = await http.get(Uri.parse(

        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            //"&channelId=$ID_CANAL"
            "&q=$pesquisa"
    ));

    if( response.statusCode == 200 ){


      Map<String, dynamic> dadosJson = json.decode( response.body );

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map); //factory
            //return Video.converterJson(map); //Static
          }
      ).toList();

      return videos;

     /* for ( var video in videos ){
        print("resultado" + video.titulo );
      }*/ //retorno de teste

      /*
      for( var video in dadosJson ["items"]){
        print("Resultado" + video.toString());
      }*/
      //print("resultado: " + dadosJson["items"][1]["snippet"]["title"].toString() );
    }else{

    }

  }

}

