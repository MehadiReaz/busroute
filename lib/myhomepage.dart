import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _originController = TextEditingController();
  final _desitnationController = TextEditingController();

  void _submitData() {
    if (_desitnationController.text.isEmpty) {
      return;
    }
    final enteredOrigin = _originController.text;
    final enteredDestination = _desitnationController.text;
    print(enteredOrigin);
    print(enteredDestination);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        'Dhaka Bus Route',
        textAlign: TextAlign.center,
      ),
    );
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Origin'),
                            controller: _originController,
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: TextField(
                            decoration:
                                InputDecoration(labelText: 'Destination'),
                            controller: _desitnationController,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OutlinedButton(
                        onPressed: _submitData,
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.purple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
