import 'package:flutter/material.dart';
import 'package:progetto/pages/bevandapage.dart';
import 'package:progetto/pages/paninopage.dart';
import 'package:progetto/pages/pizzapage.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(this.title, this.cardImage,this.supportingText,this.page,{super.key});


  final String title;
  final NetworkImage cardImage;
  final String supportingText;
  final int page;

  void pageSelector(BuildContext context){
    switch(page){
      case 1:
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PizzaPageState()));
              break;
      case 2:
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaninoPageState()));
              break;
      case 3:
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BevandaPageState()));
              break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;
    return Padding(padding: const EdgeInsets.all(0),
    child: isLarge
    ?  GestureDetector(onTap:(){pageSelector(context);},
        child: Card(
         elevation: 50,
            shadowColor: Colors.black,
            color: Colors.deepOrange[100],
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange[500],
                      radius: 108,
                      child: CircleAvatar(
                        backgroundImage: cardImage, 
                        radius: 100,
                      ), 
                    ),
                    const SizedBox(
                      height: 10,
                    ), 
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepOrange[900],
                          fontWeight: FontWeight.w500,
                        ), 
                      ),
                    ), 
                    const SizedBox(
                      height: 10,
                    ), 
                     Center(
                       child: Text(
                        supportingText,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrange,
                        ),
                    ),
                     ), 
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ), 
            ),
          )
      )
    
    
    :GestureDetector(onTap:(){pageSelector(context);},
        child: Card(
         elevation: 50,
            shadowColor: Colors.black,
            color: Colors.deepOrange[100],
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange[500],
                      radius: 108,
                      child: CircleAvatar(
                        backgroundImage: cardImage, 
                        radius: 100,
                      ), 
                    ),
                    const SizedBox(
                      height: 10,
                    ), 
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepOrange[900],
                          fontWeight: FontWeight.w500,
                        ), 
                      ),
                    ), 
                    const SizedBox(
                      height: 10,
                    ), 
                     Center(
                       child: Text(
                        supportingText,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrange,
                        ),
                    ),
                     ), 
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ), 
            ),
          )
      ),);
  }
}