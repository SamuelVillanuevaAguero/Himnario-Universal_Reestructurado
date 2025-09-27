import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart' show rootBundle;

class Himno {
  String titulo;
  int numero;
  String letra;
  bool esFavorito;
  String? rutaAudio;

  Himno({
    required this.titulo,
    required this.numero,
    required this.letra,
    required this.esFavorito,
    this.rutaAudio,
  });

  void cambiarFavorito(){
    esFavorito = !esFavorito;
  }

  static Future<List<Himno>> obtenerLista() async {
    final List<String> nombresHimnos = await obtenerNombresArchivos();
    List<Himno> listaHimnos = [];

    for (final nombre in nombresHimnos) {
      try {
        String contenido = await leerHimno('assets/letras/$nombre');
        List<String> lineas = contenido.split('\n');
        
        if (lineas.length < 5) {
          log('Himno $nombre tiene formato incorrecto');
          continue;
        }

        listaHimnos.add(
          Himno(
            titulo: lineas[0].trim(),
            numero: int.parse(nombre.split('_')[0].trim()),
            letra: lineas.skip(4).toList().join('\n').trim(),
            esFavorito: false,
          ),
        );
      } catch (e) {
        log('Error procesando himno $nombre: $e');
      }
    }
    
    listaHimnos.sort((a, b) => a.numero.compareTo(b.numero));
    return listaHimnos;
  }

  static Future<String> leerHimno(String ruta) async {
    try {
      // loadString() es síncrono, pero lo mantenemos como Future para consistencia
      return rootBundle.loadString(ruta);
    } catch (e) {
      log('Error al leer el archivo $ruta: $e');
      return '';
    }
  }

  static Future<List<String>> obtenerNombresArchivos() async {
    try {
      // CORRECCIÓN: sin await
      final contenidoManifest = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(contenidoManifest);

      final nombresArchivos = manifestMap.keys
          .where((String key) => key.startsWith('assets/letras/'))
          .map((String key) => key.split('/').last)
          .where((nombre) => nombre.isNotEmpty)
          .toList();

      return nombresArchivos;
    } catch (e) {
      log('Error leyendo AssetManifest: $e');
      return [];
    }
  }
}