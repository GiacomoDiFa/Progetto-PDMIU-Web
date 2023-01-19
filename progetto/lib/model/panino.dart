import 'package:progetto/model/cibo.dart';
import 'package:uuid/uuid.dart';
const _uuid = Uuid();
class Panino extends Cibo{
  Panino(super.id,super.name,super.description,super.price,super.image);

  factory Panino.fromJson(Map<String, dynamic> json){
     return Panino(_uuid.v4(), json["name"], json["description"], json["price"], json["image"]);
  }

  Map<String, dynamic> toJson() =>{
    'id':id,
    'name':name,
    'description':description,
    'price':price,
    'image':image
  };
}