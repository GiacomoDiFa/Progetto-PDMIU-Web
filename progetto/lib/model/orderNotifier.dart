import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto/model/order.dart';

import 'cibo.dart';

class OrderNotifier extends StateNotifier<Ordination>{
  OrderNotifier(super.state);
  void setOrder(String id, List<Cibo> cibos, String tableNumber){
    state = state..id = id;
    state = state..ciboList = cibos;
    state = state..tableNumber = tableNumber;
  }
}