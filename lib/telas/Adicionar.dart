import 'package:flutter/material.dart';

class Adicionar extends StatefulWidget {
  @override
  _AdicionarState createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Adicionar",
          style: TextStyle(
              fontSize: 25
          ),
        ),
      ),
    );
  }
}
