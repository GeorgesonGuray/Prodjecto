import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green, // Green bg color
        appBar: AppBar(
          title: Text('Prodjecto'),
          centerTitle: true,
          backgroundColor: Colors.green[800], // Darker green for the AppBar
        ),
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String projectName = '';
  String projectDescription = '';
  String team members = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Prodjecto', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)), 
          SizedBox(height: 8),
          Text('Your ultimate destination for projects', style: TextStyle(fontSize: 18, color: Colors.black)),  
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _showForm(context),
            child: Text('Add to Waitlist'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green[700], // Dark green button
            ),
          )
        ],
      ),
    );
  }

  void _showForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green[50], // Light green dialog background
          title: Text('Add to Waitlist', style: TextStyle(color: Colors.black)), // Black font color
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => name = value!,
                  style: TextStyle(color: Colors.black), 
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) => email = value!,
                  style: TextStyle(color: Colors.black), 
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Project Name'),
                  onSaved: (value) => projectName = value!,
                  style: TextStyle(color: Colors.black), 
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Project Description'),
                  onSaved: (value) => projectDescription = value!,
                  style: TextStyle(color: Colors.black), 
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Team Members'),
                  onSaved: (value) => team members = value!,
                  style: TextStyle(color: Colors.black), 
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Submit to Waitlist'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[700], // Dark green button
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
