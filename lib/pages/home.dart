import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'configuration.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _incrementCounter() {
    setState(() {
      PrefService.setInt('counter', PrefService.getInt('counter')+1);
    });
  }

  void _decrementCounter() {
    setState(() {
      PrefService.setInt('counter', PrefService.getInt('counter')-1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PrefService.getString('title')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              await Navigator.push(context,
                MaterialPageRoute(builder: (context) => Configuration()),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(PrefService.getBool('show_label')?
              'You have pushed the button this many times:'
              :"No Label",
            ),
            Text(PrefService.getBool('show_counter')?
              '${PrefService.getInt('counter')}':"No Counter",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: PrefService.getBool('action_decrement')?
              _decrementCounter:null,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            backgroundColor: PrefService.getBool('action_decrement')?
              Colors.tealAccent:Colors.grey,
            heroTag: null
          ),
          FloatingActionButton(
            onPressed: PrefService.getBool('action_increment')?
              _incrementCounter:null,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            backgroundColor: PrefService.getBool('action_increment')?
              Colors.tealAccent:Colors.grey,
            heroTag: null
          ),
        ],
      ),
    );
  }
}
