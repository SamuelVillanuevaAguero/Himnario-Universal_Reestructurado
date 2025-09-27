import 'package:flutter/material.dart';
import 'package:himnario_universal/models/himno.dart';

class WidgetHimno extends StatefulWidget{
  Himno himno;
  WidgetHimno({super.key, required this.himno});
  
  @override
  _WidgetHimno createState() => _WidgetHimno();
}

class _WidgetHimno extends State<WidgetHimno>{
  late Himno _himno;

  @override
  void initState() {
    super.initState();

    //Inicializar el himno
    _himno = widget.himno;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_himno.titulo),
      subtitle: Text('.'),
      leading: Text('${_himno.numero}'),
      trailing: GestureDetector(
        child: Icon(Icons.favorite_border),
        onTap: () {
        },
      ),
    );
  }
}