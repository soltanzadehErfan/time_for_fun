import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TimeForFunTask',
        home: HomeScreen(),
      ),
    );
  }
}
