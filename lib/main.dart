import 'package:convertidorunidades2/functions/convertFunctions.dart';
import 'package:convertidorunidades2/widgets/convert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertidor',
      home: const Convertidor(),
    );
  }
}

class Convertidor extends StatefulWidget {
  const Convertidor({super.key});

  @override
  State<Convertidor> createState() => _Convertidor();
}

class _Convertidor extends State<Convertidor> {
  int actualPage = 0;

  final List<Map<String, dynamic>> varMap = [
  {'title': 'Celsius <> Rankine', 'Color': Colors.green, 'component': Convert(color: Colors.green,function: convertirCelsiusRankine, unit1: "Celsius", unit2: "Rankine")},
  {'title': 'Años luz <> Unidad astronómica', 'Color': Colors.red, 'component': Convert(color: Colors.red,function: convertirAnosLuzAU, unit1: "Años luz", unit2: "Unidad astronómica")},
  {'title': 'Metro <> Milla náutica', 'Color': Colors.blue, 'component': Convert(color: Colors.blue,function: convertirMetroMillaNautica, unit1: "Metro", unit2: "Milla náutica")},
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(varMap[actualPage]['title'],style: TextStyle(color: Colors.white)),
        backgroundColor:  varMap[actualPage]['Color'],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 70,
              child: DrawerHeader(
                decoration: BoxDecoration(color: varMap[actualPage]['Color']),
                child: Text(
                  'Categorías',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            for (int i = 0; i < varMap.length; i++)
              ListTile(
                tileColor: actualPage == i ? const Color.fromARGB(255, 218, 216, 216) : null,
                title: Text(varMap[i]['title'],),
                onTap: () {
                  setState(() {
                    actualPage = i;
                  });
                  // Navigator.pop(context); // cerrar el drawer
                },
              ),
          ],
        ),
      ),
      body: varMap[actualPage]['component'],
    );
  }
}
