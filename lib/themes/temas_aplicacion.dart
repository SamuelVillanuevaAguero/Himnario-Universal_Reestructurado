import 'package:flutter/material.dart';

//Paleta de colores del tema claro
ThemeData temaClaro = ThemeData.light().copyWith(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    
  )
);


//Paleta de colores del tema oscuro
ThemeData temaOscuro = ThemeData.dark().copyWith(
  //Colores de la navegación baja
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
  ),
);
