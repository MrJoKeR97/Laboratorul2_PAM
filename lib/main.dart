import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratorul 2',
      theme: ThemeData
        (
         primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Laboratorul 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

   final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String response = '';
  int counter = 0;
  final calculatorController = TextEditingController();
  final letter1 = 'A';
  final letter2 = 'a';
  void _incrementCounter() async {
    setState(() {

      List<String> words = calculatorController.text.split(' ');
      for (String item in words) {
        if (item.contains(letter1 , 0) || item.contains(letter2 , 0)) {
          counter++;
        }
      }
      response = 'Words: $counter';
      counter = 0;
    });
  }
  void _reset() async {
    setState(() {
      counter = 0;
      response = '';
      formKey.currentState?.reset();
      calculatorController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

        title: Text(widget.title),
    ),
    body: Center(

    child: Padding(
    padding: const EdgeInsets.all(30),
    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Numărul de literele a/A:',
          textAlign: TextAlign.center,
        ),
        Text(
          response,
          style: Theme.of(context).textTheme.headline4,
        ),
        TextButton(onPressed: _incrementCounter,
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple),),
          child: const Text('Calculează',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(onPressed: _reset,
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple),),
          child: const Text('Resetare',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Scrie textul',
          ),
          controller: calculatorController,
        ),
      ],
    ),
    )
    ),
    );
  }
}