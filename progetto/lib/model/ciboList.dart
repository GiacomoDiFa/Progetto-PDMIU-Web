import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cibo.dart';

class CiboList extends StateNotifier<List<Cibo>>{
  CiboList(super.state);
  void addCibo(String id, String name,String description, double price, String image){
    state = [
      ...state,
      Cibo(id,name,description, price, image),
    ];
  }
  void removeCibo(String id) {
    state = state.where((element) => element.id != id).toList();
  }
  
  String totalPrice()
  {
    double price = 0;
    for(var i in state){
      price += i.price;
    }
    return price.toString();
  }
  void clearAllCibos()
  {
    state = [];
  }
}

