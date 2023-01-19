import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto/main.dart';
import 'package:progetto/model/panino.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:progetto/pages/bottom.dart';
import 'package:uuid/uuid.dart';

class PaninoPageState extends StatefulWidget{
  const PaninoPageState({super.key});

  @override
  State<StatefulWidget> createState() => _PaninoPageState();
}
  
class _PaninoPageState extends State<PaninoPageState>{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("OrdinApp(Pizza)"),
      actions: const [MyBadge()]),
      body: const PaninoPageView(),
    );
  }
}

const _uuid = Uuid();

class PaninoPageView extends ConsumerWidget{
  const PaninoPageView({super.key});

  Future<List<Panino>> ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/panino.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Panino.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: isLarge 
      ?
      FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items = data.data as List<Panino>;
              return ListView.builder(
                itemCount: items == null ? 0:items.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {
                      debugPrint("tappato");
                    },
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                                  child: Image.asset(items[index].image,height: 600,width: 600,),
                                ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(items[index].name,style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Center(child: Text(items[index].description)),
                                  Text("Prezzo: ${items[index].price.toString()}€"),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: (){
                                          final pizza = items[index];
                                          ref.read(cibosProvider.notifier).addCibo(_uuid.v4(), pizza.name, pizza.description, pizza.price, pizza.image);
                                        },
                                        child: const Center(child: Text("Aggiungi all'ordine"))),
                                    ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        )
        :
        FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items = data.data as List<Panino>;
              return ListView.builder(
                itemCount: items == null ? 0:items.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {
                      debugPrint("tappato");
                    },
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                                  child: Image.asset(items[index].image,height: 200,width: 200,),
                                ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(items[index].name,style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Center(child: Text(items[index].description)),
                                  Text("Prezzo: ${items[index].price.toString()}€"),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: (){
                                          final pizza = items[index];
                                          ref.read(cibosProvider.notifier).addCibo(_uuid.v4(), pizza.name, pizza.description, pizza.price, pizza.image);
                                        },
                                        child: const Center(child: Text("Aggiungi all'ordine"))),
                                    ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }
}