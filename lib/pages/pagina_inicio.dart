import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:himnario_universal/models/himno.dart';
import 'package:himnario_universal/widgets/widget_himno.dart';
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
        Carrusel(altura: 280),

        //Lista de himnos
        PanelHimnos(),
      ],
    );
  }
}

//Widget - lista de himnos (Página principal - Inicio)
class PanelHimnos extends StatefulWidget {
  const PanelHimnos({super.key});

  @override
  _PanelHimnosState createState() => _PanelHimnosState();
}

class _PanelHimnosState extends State<PanelHimnos> {
  late TextEditingController _controladorBusqueda;

  @override
  void initState() {
    super.initState();

    //Inicializar el controlador de búsqueda
    _controladorBusqueda = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //Espaciado
              SizedBox(height: 20),

              //icono Inicio - Himnos | Universal
              Row(
                children: [
                  //Icono - Inicio
                  Icon(Icons.home, color: Colors.lightBlueAccent, size: 30),

                  //Espaciado
                  SizedBox(width: 10),

                  //Texto 'Himnos | Universal'
                  Text(
                    'Himnos | Universal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              //Espaciado
              SizedBox(height: 15),

              //Campo de búsqueda
              TextField(
                //Controlador del campo de texto
                controller: _controladorBusqueda,

                //Borde, colores, estilos, etc.
                decoration: InputDecoration(
                  //Texto por defecto
                  hintText: 'Buscar por título, número o letra',
                  hoverColor: const Color.fromARGB(30, 0, 0, 0),

                  //Borde por defecto
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  //Borde al seleccionarlo
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  //Relleno del campo de texto
                  filled: true,
                  fillColor: const Color.fromARGB(30, 0, 0, 0),
                  prefixIcon: Icon(Icons.search),
                ),
              ),

              //Espaciado
              SizedBox(height: 20),

              //Lista de himnos
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Text('data');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
