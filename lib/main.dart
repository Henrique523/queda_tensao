import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queda_tensao/pages/cable_info.dart';
import 'package:queda_tensao/pages/results_page.dart';
import 'package:queda_tensao/pages/select_cable.dart';
import 'package:queda_tensao/providers/calc_data.dart';
import 'package:queda_tensao/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalcData>(create: (_) => CalcData()),
      ],
      child: MaterialApp(
        title: 'Queda Tensão',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (ctx) => SelectCable(),
          AppRoutes.CABLE_INFO: (ctx) => CableInfo(),
          AppRoutes.RESULTS_PAGE: (ctx) => ResultsPage(),
        },
      ),
    );
  }
}
