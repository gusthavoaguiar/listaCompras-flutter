import 'package:flutter/material.dart';
import 'package:listacompras/page/home_page.dart';

void main() => runApp( MyApp());

class MyApp extends MaterialApp {
  MyApp({super.key}) : super(
  debugShowCheckedModeBanner: false,
  home:  ShoppingListApp(),
  theme: ThemeData(brightness: Brightness.dark)
  );
}
