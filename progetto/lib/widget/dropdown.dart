import 'package:flutter/material.dart';

const List<String> list = <String>['Uno', 'Due', 'Tre', 'Quattro', 'Cinque', 'Sei', 'Sette','Otto','Nove','Dieci'];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DropdownButtonExample();
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => DropdownButtonExampleState();
}
/*attenzione l'ho messa globale per memorizzarla facilmente, ma non so se può andare bene*/
String selectedValue = "";
class DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;
  String get valoreDropdown{
    if(selectedValue == ""){
      selectedValue = "Uno";
    }
    return selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepOrange),
      underline: Container(
        height: 2,
        color: Colors.deepOrange,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          selectedValue = value;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
