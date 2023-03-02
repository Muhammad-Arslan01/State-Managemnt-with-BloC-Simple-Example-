import 'package:bloc_state_management/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  final counterBloc=CounterBloc();
  // void _incrementCounter() {
  //   setState(() {
 
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
 
        title: Text(widget.title),
      ),
      body: Center(
 
        child: Column(
 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){          
              counterBloc.eventSink.add(CounterAction.increment);
            
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: (){          
              counterBloc.eventSink.add(CounterAction.decrement);
               
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),

          FloatingActionButton(
            onPressed: (){          
              counterBloc.eventSink.add(CounterAction.reset);
               
            },
            tooltip: 'Reset',
            child: const Icon(Icons.loop),
          ),  

        ],
      ),  
    );
  }
}
