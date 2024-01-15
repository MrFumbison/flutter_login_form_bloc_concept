import 'package:flutter/material.dart';
import '../src/screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget{
  const App({super.key});

 
  @override
  build(context){
    return Provider(
      key: UniqueKey(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'log me in',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Log me in'),
        ),
        body: const LoginScreen(),
      ),
        ),
    );
  }
}