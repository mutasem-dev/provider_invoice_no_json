import 'package:flutter/material.dart';
import 'customersPage.dart';
import 'invoice_model.dart';
import 'package:provider/provider.dart';
import 'mainPage.dart';
import 'detailsPage.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => InvoiceModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context)=>MainPage(),
        '/customers_page' : (context)=>CustomersPage(),
        '/details_page' : (context)=>DetailsPage()
      },
    );
  }
}

