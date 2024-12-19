// Calculadora Flutter - Layout responsivo
import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operacao = "";

  void botaoPressionado(String botaoTexto) {
    if (botaoTexto == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operacao = "";
    } else if (botaoTexto == "+" || botaoTexto == "-" || botaoTexto == "x" || botaoTexto == "/") {
      num1 = double.parse(output);
      operacao = botaoTexto;
      _output = "0";
    } else if (botaoTexto == "=") {
      num2 = double.parse(output);

      switch (operacao) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "x":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
      }

      num1 = 0.0;
      num2 = 0.0;
      operacao = "";
    } else {
      _output += botaoTexto;
    }

    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget buildButton(String botaoTexto) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
        ),
        onPressed: () => botaoPressionado(botaoTexto),
        child: Text(
          botaoTexto,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height * 0.2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Web'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            height: displayHeight,
            child: Text(
              output,
              style: TextStyle(fontSize: displayHeight * 0.4, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x")
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                children: [
                  buildButton("C"),
                  buildButton("0"),
                  buildButton("="),
                  buildButton("+")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
