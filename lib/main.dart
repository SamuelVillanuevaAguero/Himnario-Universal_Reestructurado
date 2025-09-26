import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:himnario_universal/themes/temas_aplicacion.dart';
import 'package:himnario_universal/pages/pagina_categorias.dart';
import 'package:himnario_universal/pages/pagina_favoritos.dart';
import 'package:himnario_universal/pages/pagina_inicio.dart';

void main() {
  runApp(_Aplicacion());
}

class _Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: temaClaro,
      darkTheme: temaOscuro,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Himnario Universal',
      home: Base(),
    );
  }
}

class Base extends StatefulWidget {
  @override
  _Base createState() => _Base();
}

class _Base extends State<Base> {
  int _indice = 0;

  late final List<Widget> _paginas;
  late final PageController _controladorPaginas;

  @override
  void initState() {
    super.initState();

    //Inicializar las páginas de la aplicación
    _paginas = [PaginaInicio(), PaginaFavoritos(), PaginaCategorias()];

    //Inicializar el controlador de la navegación (PageView)
    _controladorPaginas = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    //Eliminar los datos del controlador al destruirse
    _controladorPaginas.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Cuerpo de la aplicación
      body: PageView(
        controller: _controladorPaginas,
        children: _paginas,
        onPageChanged: (value) {
          setState(() {
            _indice = value;
          });
        },
      ),

      //Navegación baja
      bottomNavigationBar: FadeInUp(
        duration: Duration(milliseconds: 1000),
        child: BottomNavigationBar(
          iconSize: 30, //Tamaño de los iconos (Inicio, Favoritos, Categorias)
          selectedItemColor:Colors.blue, //Color de las letras al seleccionar una página
          items: [
            //Inicio
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, color: Colors.blue),
              label: 'Inicio',
            ),

            //Favoritos
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite, color: Colors.blue),
              label: 'Favoritos',
            ),

            //Categorias
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category, color: Colors.blue),
              label: 'Categorias',
            ),
          ],

          //Método que se lanza cuando se presiona algún item
          onTap: (value) {
            setState(() {
              _controladorPaginas.animateToPage(
                value,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },

          //Indice actual (página seleccionada)
          currentIndex: _indice,
        ),
      ),
    );
  }
}
