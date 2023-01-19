import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto/main.dart';
import 'package:progetto/model/database.dart';
import 'package:progetto/widget/dialogAllert.dart';
import 'package:progetto/widget/dropdown.dart';


class Carrello extends ConsumerWidget{
  const Carrello({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final cibos = ref.watch(cibosProvider);
    Database db = Database();
    final prezzo = ref.watch(cibosProvider.notifier).totalPrice();

    return Scaffold(
      appBar: AppBar(title: const Text("Carrello"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text("Questa è la tua ordinazione. Per eliminare una pietanza dall'ordinazione, fai scorrere la pietanza al di fuori dello schermo."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text("Seleziona il tavolo in cui sei seduto:",style: Theme.of(context).textTheme.headline6),
              const DropdownButtonApp(),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cibos.length,
              itemBuilder: (context, index) {
          
                // Il widget Dismissible permette di rimuovere gli elementi dalla lista con
                // un trascinamento laterale. Ogni elemento deve essere identificato
                // necessariamente da una chiave: usiamo ValueKey a tale scopo, sfruttando
                // l'ID del todo come chiave univoca all'interno della lista.
                return Dismissible(
                  key: ValueKey(cibos[index].id),
                  onDismissed: (_) {
                    ref.read(cibosProvider.notifier).removeCibo(cibos[index].id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.blueGrey.shade100,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset.fromDirection(120, 8),
                              color: Colors.black12)
                        ]),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(cibos[index].name,
                            style: Theme.of(context).textTheme.headline5),
                        Text("${cibos[index].price}€",
                        style: Theme.of(context).textTheme.headline5 ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text("Prezzo totale: $prezzo €",style: Theme.of(context).textTheme.headline5 ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Padding(
                padding:  EdgeInsets.all(20.0),
                child: DialogAllert()/*ElevatedButton(onPressed: (){
                  /*mettere dialog*/
                  ref.read(orderProvider.notifier).setOrder(_uuid.v4(), cibos, DropdownButtonExampleState().valoreDropdown);
                  debugPrint(ref.watch(orderProvider).tableNumber);
                  db.saveOrderToDatabase(order: ref.watch(orderProvider));
                }, child: const Text("Conferma ordine")),*/
              ),
            ],
          ),
        ],
      ),
    );
  }
}