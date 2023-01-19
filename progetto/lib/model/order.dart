import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'cibo.dart';

class Ordination {
  String id;
  List<Cibo> ciboList;
  String tableNumber;

  Ordination(this.id,this.ciboList,this.tableNumber);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cibolist':ciboList,
      'tableNumber':tableNumber
    };
    }
    dynamic getListMap(List<dynamic> items) {
      if (items == null) {
        return null;
        }
        List<Map<String, dynamic>> dayItems = [];
        for (var element in items) {
          dayItems.add(element.toMap());
          }
          return dayItems;
}
}