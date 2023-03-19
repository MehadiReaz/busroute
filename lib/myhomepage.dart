import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePagerState createState() => _MyHomePagerState();
}

class _MyHomePagerState extends State<MyHomePage> {
  String _origin = '';
  String _destination = '';
  String _matchingBusName = '';

  final List<Map<String, dynamic>> _buses = [
    {
      'busName': 'Raida',
      'locations': ['khilkhet', 'airport', 'rampura'],
    },
    {
      'busName': 'Victor',
      'locations': ['mohakhali', 'gulistan', 'sydabad'],
    },
  ];

  List<String> originSuggestions = ['airport', 'khilkhet', 'rampura'];
  List<String> destinationSuggestions = ['banani', 'bashundhara', 'gulshan'];

  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  void _findMatchingBusName() {
    for (final bus in _buses) {
      if (bus['locations'].contains(_origin.toLowerCase()) &&
          bus['locations'].contains(_destination.toLowerCase())) {
        setState(() {
          _matchingBusName = bus['busName'];
        });
        return;
      }
    }
    setState(() {
      _matchingBusName = 'No matching bus found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Finder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return originSuggestions
                    .where((suggestion) => suggestion
                        .startsWith(textEditingValue.text.toLowerCase()))
                    .toList();
              },
              onSelected: (String selected) {
                setState(() {
                  _originController.text = selected;
                  _origin = selected;
                });
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: 'Origin',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _origin = value;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 20.0),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return destinationSuggestions
                    .where((suggestion) => suggestion
                        .startsWith(textEditingValue.text.toLowerCase()))
                    .toList();
              },
              onSelected: (String selected) {
                setState(() {
                  _destinationController.text = selected;
                  _destination = selected;
                });
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: 'Destination',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _destination = value;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _findMatchingBusName,
              child: Text('Find Matching Bus'),
            ),
            SizedBox(height: 20.0),
            Text(
              _matchingBusName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
