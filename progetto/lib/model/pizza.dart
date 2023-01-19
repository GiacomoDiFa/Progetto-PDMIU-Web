import 'package:progetto/model/cibo.dart';
import 'package:uuid/uuid.dart';
const _uuid = Uuid();
class Pizza extends Cibo{
  Pizza(super.id,super.name,super.description,super.price,super.image);  
  
  factory Pizza.fromJson(Map<String, dynamic> json){
     return Pizza(_uuid.v4(), json["name"], json["description"], json["price"], json["image"]);
  }

  Map<String, dynamic> toJson() =>{
    'id':id,
    'name':name,
    'description':description,
    'price':price,
    'image':image
  };
}