import 'package:flutter/material.dart';
import 'package:dsc_flutter_class/models/note.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // We return a MaterialApp widget
        // To define the theme or design language of our app
        // Material is for Android OS, Cupertino is for iOS
        title: "DSC Unilag", // Your title / AppName
        theme: ThemeData(
          // Here we set the theme of our app
          primarySwatch: Colors.blue, // With our primaryColor as colors.blue
          // flutter has a library of material design colors you can choose from
          // you can also create you own color code visit http://flutter.io
          // for further details
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("DSC Unilag"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.create),
          ),
          body:
              HomePageContent(), // Here we set the home of our material app to be
          // HomepageContent() which is also as Widget but this time its a stateful widget
        ));
  }
}

class HomePageContent extends StatefulWidget {
  // Here is our definition of HomePageContent which is a StatefulWidget

  // To implement a StatefulWidget you need to define a class that extends
  // the state of that widget
  @override
  State<StatefulWidget> createState() {
    // A StatefulWidget overrides createState() which create a new state from
    // The state we define which we will return as HomePageContentState
    return HomePageContentState();
  }
}

class HomePageContentState extends State<HomePageContent> {
  // HomePageContentState extends the State HomePageContent Which tell flutter
  // To to render the content in the build method

  List<Note> noteData = dummyData;

  @override
  Widget build(BuildContext context) {
    // Inside the build method we return a Scaffold widget, Which is an
    // important widget in the flutter design library
    // The Scaffold widget defines the Properties such as AppBar,
    // FloatingActionBar, Drawer, BackgroundColor, BottomSheet, BottomNavigationBar
    // Body which is were you implement the content you want to display on screen in
    return ListView.builder(
      itemCount: noteData.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildList(noteData[index]);
      },
    );
  }

  void _showSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("FAB pressed")));
  }

  Widget _buildList(Note noteData) {
    return GestureDetector(
      onTap: () {
        _showSnackBar();
      },
      child: ListTile(
        title: Text(
          noteData.title,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(
          noteData.content,
          maxLines: 3,
        ),
      ),
    );
  }
}
