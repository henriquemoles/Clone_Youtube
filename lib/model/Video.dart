import 'package:flutter/foundation.dart';

class Video {

  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  /*static converterJson(Map<String,dynamic> json){
    return Video(
      id: json["id"] ["videoId"],
      titulo: json["snippet"] ["title"],
      imagem: json["snippet"] ["thumbnails"] ["high"]["url"],
      canal: json["snippet"] ["channelId"],
    ); // RETORNO DE MULTIPLAS INSTANCIAS ALTO CONSUMO DE MEMÓRIA
  }*/

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"] ["videoId"],
      titulo: json["snippet"] ["title"],
      descricao: json["snippet"] ["description"],
      imagem: json["snippet"] ["thumbnails"] ["high"]["url"],
      canal: json["snippet"] ["channelTitle"],
    );
  } //Retorno de uma unica instancia MENOS CONSUMO DE MEMÓRIA

}