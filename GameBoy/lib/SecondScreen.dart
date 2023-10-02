import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
      ),
      body: Container(
        color: Color(0xFF69801D), // Cor #69801D
        child: Center(
          child: Text(
            'Conteúdo da Segunda Tela',
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
