import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _origin = ''.toLowerCase();
  String _destination = ''.toLowerCase();
  String _matchingBusName = '';

  final List<Map<String, dynamic>> _buses = [
    {
      'busName': 'Achim Paribahan',
      'locations': ['khilkhet', 'airport', 'rampura'],
    },
    {
      'busName': 'Victor',
      'locations': ['mohakhali', 'gulistan', 'sydabad'],
    },
  ];

  void _findMatchingBus() {
    for (int i = 0; i < _buses.length; i++) {
      List<String> busLocations = _buses[i]['locations'];
      if (busLocations.contains(_origin) &&
          busLocations.contains(_destination)) {
        setState(() {
          _matchingBusName = _buses[i]['busName'];
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Finder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Origin',
              ),
              onChanged: (value) {
                setState(() {
                  _origin = value.toLowerCase();
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Destination',
              ),
              onChanged: (value) {
                setState(() {
                  _destination = value.toLowerCase();
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _findMatchingBus,
              child: Text('Find Bus'),
            ),
            SizedBox(height: 16.0),
            _matchingBusName.isNotEmpty
                ? Text(
                    'Matching Bus: $_matchingBusName',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
