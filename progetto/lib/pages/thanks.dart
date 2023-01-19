import 'package:flutter/material.dart';
import 'package:progetto/pages/bottom.dart';

class Thanks extends StatelessWidget{
  const Thanks({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: isLarge ?
      Scaffold(
        appBar: AppBar(title: (const Text("OrderApp"))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Grazie per il tuo ordine!",style: Theme.of(context).textTheme.headline4)),
            const Center(child: Image(image: AssetImage('assets/order_complete.gif'),height: 396,)),
            Center(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
                  (Route<dynamic> route) => false,);
                }, child: const Text("Torna all' Homepage")),
              ),
            )
          ],
        ))
      :
      Scaffold(
        appBar: AppBar(title: (const Text("OrderApp"))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Grazie per il tuo ordine!",style: Theme.of(context).textTheme.headline4)),
            const Center(child: Image(image: AssetImage('assets/order_complete.gif'),height: 396,)),
            Center(
              child: ElevatedButton(onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
                (Route<dynamic> route) => false,);
              }, child: const Text("Torna all' Homepage")),
            )
          ],
        )),
    );
  }

}