import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progetto/model/cibo.dart';
import 'package:progetto/model/ciboList.dart';
import 'package:progetto/model/order.dart';
import 'package:progetto/model/orderNotifier.dart';
import 'package:progetto/pages/bottom.dart';
import 'package:progetto/widget/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final cibosProvider = StateNotifierProvider<CiboList, List<Cibo>>((ref)=> CiboList([]));
final orderProvider = StateNotifierProvider<OrderNotifier, Ordination>((ref) => OrderNotifier(Ordination(_uuid.v4(),[],"0")));
final ciboCountProvider = Provider((ref) => ref.watch(cibosProvider).length);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(apiKey: "AIzaSyD8Gr7xcYJGLno6msGJgQs3-WrQWK9F7fo", 
      appId: "1:817007782526:web:8b8d2dfd561ab773c5c62f", messagingSenderId: "817007782526", projectId: "onlinemenu-dfdf2")
    );
  }
  else{
    await Firebase.initializeApp();  
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyHomePage extends StatelessWidget{

  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(0),
      child: (isLarge)?
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Flexible(
            child: HomeCard(
              "Ordina Pizza",
              NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg/800px-Eq_it-na_pizza-margherita_sep2005_sml.jpg'),
              'Pizze bellissime e buonissime. ',1),
          ),
          Flexible(
            child: HomeCard(
              "Ordina Panino",
              NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/1024px-Hamburger_%28black_bg%29.jpg'),
              'Panini bellissimi e buonissimi (una porzione di patatine è inclusa insieme al panino)',2),
          ),
          Flexible(
            child: HomeCard(
              "Ordina Bevanda",
              NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/b/ba/Export_hell_seidel_steiner.png'),
                'Bevande bellissime, buonissime e freschissime.',3),
          ),
        ],
      )
      
      
      
      :ListView(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            HomeCard(
              "Ordina Pizza",
              NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg/800px-Eq_it-na_pizza-margherita_sep2005_sml.jpg'),
              'Pizze bellissime e buonissime. ',1),
            HomeCard(
              "Ordina Panino",
              NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Hamburger_%28black_bg%29.jpg/1024px-Hamburger_%28black_bg%29.jpg'),
              'Panini bellissimi e buonissimi (una porzione di patatine è inclusa insieme al panino)',2),
            HomeCard(
              "Ordina Bevanda",
              NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/b/ba/Export_hell_seidel_steiner.png'),
                'Bevande bellissime, buonissime e freschissime.',3),
          ],
        ),
        ],
      ),) 
    );
  }
}


