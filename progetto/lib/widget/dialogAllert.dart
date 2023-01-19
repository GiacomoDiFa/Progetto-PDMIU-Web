import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto/main.dart';
import 'package:progetto/pages/thanks.dart';
import 'package:progetto/widget/dropdown.dart';
import 'package:uuid/uuid.dart';

import '../model/database.dart';

class DialogAllert extends ConsumerWidget {
  const DialogAllert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const _uuid = Uuid();
    final cibos = ref.watch(cibosProvider);
    Database db = Database();
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Confermi l'ordinazione?"),
          content: const Text('Se confermi non potrai più tornare indietro'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Annulla'),
              child: const Text('Annulla'),
            ),
            TextButton(
              onPressed: () 
              {
                ref.read(orderProvider.notifier).setOrder(_uuid.v4(), cibos, DropdownButtonExampleState().valoreDropdown);
                debugPrint(ref.watch(orderProvider).tableNumber);
                db.saveOrderToDatabase(order: ref.watch(orderProvider));
                ref.read(cibosProvider.notifier).clearAllCibos();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Thanks()),
                (Route<dynamic> route) => false,);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child:  Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.deepOrange),
        child: const Text(style: TextStyle(color: Colors.white),'Conferma ordine')),
    );
  }
}