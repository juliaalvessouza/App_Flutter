import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle bigTitle = const TextStyle(
      fontSize: 32, color: Colors.lightBlueAccent, fontWeight: FontWeight.w700);

// aqui criou uma variável - tipo classe do css
  static BoxDecoration containerDeco = BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(width: 2, color: Colors.black54),
  );

//aqui criei uma função onde tenho a liberdade de modificar o radius por exemplo.... passo os exemplos que quero.
  static BoxDecoration containerDecoFlexible(border) {
    return BoxDecoration(
      color: Color.fromARGB(151, 83, 177, 117),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 2,
        color: Color.fromARGB(151, 83, 177, 117),
      ),
    );
  }
}
