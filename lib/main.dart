import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TransitEase',
      home: SplashScreen(), // Navigate to SplashScreen first
    );
  }
}

// Title Screen with short delay and navigation
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TRANSITease'), // Customize title screen content
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Bus { // Define the Bus class
  final String Number;
  final Map<String, String> schedule;

  Bus({required this.Number, required this.schedule});
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Bus> _buses = [
    Bus(Number: '5',
        schedule: {'from': 'College', 'to': 'Aluva', 'time': '10:00'}),
    Bus(Number: '5',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '6',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '7',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '8',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '9',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '10',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '12',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '19',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '22',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '23',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '27',
        schedule: {'from': 'College', 'to': 'Angamaly', 'time': '10:30'}),
    Bus(Number: '6',
        schedule: {'from': 'College', 'to': 'Aluva', 'time': '10:00'}),
    Bus(Number: '7',
        schedule: {'from': 'College', 'to': 'Aluva', 'time': '10:00'}),
    Bus(Number: '8',
        schedule: {'from': 'College', 'to': 'Aluva', 'time': '10:00'}),
    Bus(Number: '9',
        schedule: {'from': 'College', 'to': 'Aluva', 'time': '10:00'}),
    Bus(Number: '10',
        schedule: {'from': 'College', 'to': 'Aluva', 'time': '10:00'}),
    Bus(Number: '8',
        schedule: {'from': 'College', 'to': 'Highcourt', 'time': '10:00'}),
    Bus(Number: '25',
        schedule: {'from': 'College', 'to': 'Irinjalakuda', 'time': '10:00'}),
    Bus(Number: '5',
        schedule: {'from': 'College', 'to': 'Kakkanad', 'time': '10:00'}),
    Bus(Number: '10',
        schedule: {'from': 'College', 'to': 'Kakkanad', 'time': '10:00'}),
    Bus(Number: '26',
        schedule: {'from': 'College', 'to': 'Kodungaloor', 'time': '10:00'}),
    Bus(Number: '12',
        schedule: {'from': 'College', 'to': 'Paravoor', 'time': '10:00'}),
    Bus(Number: '19',
        schedule: {'from': 'College', 'to': 'Paravoor', 'time': '10:00'}),
    Bus(Number: '22',
        schedule: {'from': 'College', 'to': 'Perumbavoor', 'time': '10:00'}),
    Bus(Number: '27',
        schedule: {'from': 'College', 'to': 'Pukattupady', 'time': '10:00'}),
    Bus(Number: '7',
        schedule: {'from': 'College', 'to': 'Thopumpady', 'time': '10:00'}),
    Bus(Number: '5',
        schedule: {'from': 'College', 'to': 'Thripunithura', 'time': '10:00'}),
    Bus(Number: '15',
        schedule: {'from': 'College', 'to': 'Trichur', 'time': '10:00'}),
    Bus(Number: '16',
        schedule: {'from': 'College', 'to': 'Trichur', 'time': '10:00'}),
    Bus(Number: '23',
        schedule: {'from': 'College', 'to': 'Vaduthala', 'time': '10:00'}),
    Bus(Number: '6',
        schedule: {'from': 'College', 'to': 'Vytilla', 'time': '10:00'}),
    Bus(Number: '7',
        schedule: {'from': 'College', 'to': 'Vytilla', 'time': '10:00'}),

  ];

  // List of locations for dropdown menus
  final List<String> locations = [
    "Select",
    'College',
    'Angamaly',
    'Aluva',
    'Highcourt',
    'Irinjalakuda',
    'Kakkanad',
    'Kodungaloor',
    'Paravoor',
    'Perumbavoor',
    'Pukattupady',
    'Thopumpady',
    'Tripunithura',
    'Trichur',
    'Vaduthala',
    'Vytilla',

  ];

  String _fromLocation = 'Select'; // Default selection
  String _toLocation = 'Select'; // Default selection

  // List to store available buses after search
  List<Bus> availableBuses = [];

  Widget get _searchResults {
    if (availableBuses.isEmpty) {
      return Text('No buses found for this Number.');
    } else {
      return Column(
        children: availableBuses.map((bus) => _buildBusListItem(bus)).toList(),
      );
    }
  }

  // Define _buildBusListItem method to display bus information
  Widget _buildBusListItem(Bus bus) {
    return ListTile(
      title: Text('Bus Number: ${bus.Number}'),
      subtitle: Text('Estimated Arrival: ${bus.schedule['time']}'),
    );
  }

  // Define _findBuses method to search for buses
  void _findBuses() {
    print("From location: $_fromLocation"); // Debug print statement
    print("To location: $_toLocation"); // Debug print statement

    // Search for buses based on user input and simulated data
    availableBuses = _buses.where((bus) =>
    bus.schedule['from'] == _fromLocation && bus.schedule['to'] == _toLocation)
        .toList(); // Convert to list
    print("Available buses: $availableBuses"); // Debug print statement

    // Update UI to display results (update availableBuses)
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Scheduler'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _fromLocation,
                    items: locations.map((location) =>
                        DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        )).toList(),
                    onChanged: (value) =>
                        setState(() => _fromLocation = value!),
                    decoration: InputDecoration(
                      labelText: 'From Location',
                    ),
                  ),
                  SizedBox(height: 10),
                  // Dropdown menu for To Location
                  DropdownButtonFormField<String>(
                    value: _toLocation,
                    items: locations.map((location) =>
                        DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        )).toList(),
                    onChanged: (value) => setState(() => _toLocation = value!),
                    decoration: InputDecoration(
                      labelText: 'To Location',
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _findBuses(),
                    child: Text('Find Buses'),
                  ),
                ],
              ),
            ),
            _searchResults,
            // Display search results or empty container
          ],
        ),
      ),
    );
  }
}