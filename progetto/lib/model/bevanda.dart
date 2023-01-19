import 'package:progetto/model/cibo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
class Bevanda extends Cibo{
  Bevanda(super.id,super.name,super.description,super.price,super.image);
  factory Bevanda.fromJson(Map<String, dynamic> json){
     return Bevanda(_uuid.v4(), json["name"], json["description"], json["price"], json["image"]);
  }

  Map<String, dynamic> toJson() =>{
    'id':id,
    'name':name,
    'description':description,
    'price':price,
    'image':image
  };
}