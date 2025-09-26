import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:himnario_universal/widgets/widgets_carrusel.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  _PaginaInicio createState() => _PaginaInicio();
}

class _PaginaInicio extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Carrusel
        FadeInDown(child: Carrusel(altura: 280)),

        //Lista de himnos
        FadeInUp(duration: Duration(milliseconds: 1000),child: Text('Himnos'))
      ],
    );
  }
}
