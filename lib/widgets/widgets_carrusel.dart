import 'package:flutter/material.dart';

class Carrusel extends StatefulWidget {
  final double altura;

  const Carrusel({super.key, required this.altura});

  @override
  _CarruselState createState() => _CarruselState();
}

class _CarruselState extends State<Carrusel> {
  late final double _altura;

  @override
  void initState() {
    super.initState();
    //Inicializar variables del widget
    _altura = widget.altura;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _altura,
      child: Container(
        color: Colors.red,
        child: Center(
          child: Text('Carrusel'),
        ),
      ),
    );
  }
}
