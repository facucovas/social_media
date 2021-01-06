// To parse this JSON data, do
//
//     final publicacionModel = publicacionModelFromJson(jsonString);

import 'dart:convert';

PublicacionModel publicacionModelFromJson(String str) => PublicacionModel.fromJson(json.decode(str));

String publicacionModelToJson(PublicacionModel data) => json.encode(data.toJson());

class PublicacionModel {
    PublicacionModel({
        this.id,
        this.cantidadComentarios,
        this.cantidadCompartidos,
        this.cantidadReacciones,
        this.climas,
        this.descripcion,
        this.fechaDuracion,
        this.fechaPublicacion,
        this.idPropietario,
        this.propietario,
        this.titulo,
    });

    String id;
    int cantidadComentarios;
    int cantidadCompartidos;
    int cantidadReacciones;
    String climas;
    String descripcion;
    DateTime fechaDuracion;
    DateTime fechaPublicacion;
    String idPropietario;
    String propietario;
    String titulo;

    factory PublicacionModel.fromJson(Map<String, dynamic> json) => PublicacionModel(
        id                  : json["id"],
        cantidadComentarios : json["cantidadComentarios"],
        cantidadCompartidos : json["cantidadCompartidos"],
        cantidadReacciones  : json["cantidadReacciones"],
        climas              : json["climax  s"],
        descripcion         : json["descripcion"],
        fechaDuracion       : json["fechaDuracion"],
        fechaPublicacion    : json["fechaPublicacion"],
        idPropietario       : json["idPropietario"],
        propietario         : json["propietario"],
        titulo              : json["titulo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cantidadComentarios": cantidadComentarios,
        "cantidadCompartidos": cantidadCompartidos,
        "cantidadReacciones": cantidadReacciones,
        "climas": climas,
        "descripcion": descripcion,
        "fechaDuracion": fechaDuracion,
        "fechaPublicacion": fechaPublicacion,
        "idPropietario": idPropietario,
        "propietario": propietario,
        "titulo": titulo,
    };
}
