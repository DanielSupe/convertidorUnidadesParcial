import 'package:flutter/material.dart';

class Convert extends StatefulWidget {
  final Color color;
  final String unit1;
  final String unit2;
  final Function function;

  const Convert({
    super.key,
    required this.color,
    required this.unit1,
    required this.unit2,
    required this.function,
  });

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  String unit = "";

   @override
  void initState() {
    super.initState();
    unit = widget.unit1;
  }

  @override
  void didUpdateWidget(Convert oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.unit1 != widget.unit1 || oldWidget.unit2 != widget.unit2) {
      setState(() {
        unit = widget.unit1;
        valorConvertir.clear();
        resultado.clear(); 
      });
    }
  }

  final TextEditingController valorConvertir = TextEditingController();
  TextEditingController resultado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.color,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      final input = double.tryParse(valorConvertir.text) ?? 0.0;
                      resultado.text =
                          widget.function(input, unit).toString();
                    });
                  },
                  child: const Text('Convertir'),
                ),
              ),
              TextField(
                controller: valorConvertir,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      'Escribe en $unit',
                ),
              ),
                Container(
                margin: const EdgeInsets.only(bottom: 20,top: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if(unit == widget.unit1) {
                        unit = widget.unit2;
                      } else {
                        unit = widget.unit1;
                      }
                    });
                  },
                  child: Icon(Icons.swap_horiz),
                ),
              ),
              Text("Resultado en ${unit == widget.unit1 ? widget.unit2 : widget.unit1}:\n${resultado.text}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
