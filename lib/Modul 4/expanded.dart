import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanded',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expanded'),
        ),
        body: Column(
          children: [
            _kotakUji(Colors.amber, 150, 'Normal'),
            Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: _kotakUji(Colors.green, 100, 'Flexible')),
            Expanded(flex: 2, child: _kotakUji(Colors.blue, 250, 'Expanded'))
          ],
        ),
      ),
    );
  }
}

// Method _kotakUji
Container _kotakUji(Color warna, double tinggi, String teks) {
  return Container(
    width: double.infinity,
    height: tinggi,
    color: warna,
    alignment: const Alignment(0.0, 0.0),
    child: Text(
      teks,
      style: const TextStyle(fontSize: 30, color: Colors.white),
    ),
  );
}

// ===== BODY VARIASI 1 =====
/*
body: Column(
  children: [
    _kotakUji(Colors.amber, 150, 'Normal'),
    Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: _kotakUji(Colors.green, 100, 'Flexible')),
    Expanded(flex: 1, child: _kotakUji(Colors.blue, 250, 'Expanded'))
  ],
),
*/

// ===== BODY VARIASI 2 =====
/*
body: Column(
  children: [
    _kotakUji(Colors.amber, 150, 'Normal'),
    _kotakUji(Colors.green, 100, 'Flexible'),
    _kotakUji(Colors.blue, 250, 'Expanded')
  ],
),
*/

// ===== BODY VARIASI 3 =====
/*
body: Column(
  children: [
    _kotakUji(Colors.amber, 150, 'Normal'),
    Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: _kotakUji(Colors.green, 100, 'Flexible')),
    Expanded(flex: 2, child: _kotakUji(Colors.blue, 250, 'Expanded'))
  ],
),
*/
