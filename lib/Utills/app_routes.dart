import 'package:flutter/cupertino.dart';
import 'package:invoice_app/Screens/pdf_screen.dart';
import 'package:invoice_app/Screens/product_info_screen.dart';
import 'package:invoice_app/Screens/product_screen.dart';
import 'package:invoice_app/Screens/splash_screen.dart';

Map<String,WidgetBuilder>screenroutes={
  '/':(context) =>SplashScreen(),
  'product':(context) => ProductScreen(),
  'productInfo':(context) => ProductInfoScreen(),
  'pdf':(context) => PdfScreen(),
};