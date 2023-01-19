import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
const _uuid = Uuid();
class Cibo{
  String id;
  String name;
  String description;
  double price;
  String image;

  Cibo(this.id,this.name,this.description,this.price,this.image);

  Map<String, dynamic> toMap() => {
    'id':id,
    'name':name,
    'description':description,
    'price':price,
    'image':image
  };
}