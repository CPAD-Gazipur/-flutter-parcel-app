import 'package:flutter/material.dart';
import 'package:flutter_parcel_app/services/services.dart';
import 'package:flutter_parcel_app/ui/views/views.dart';
import 'package:flutter_parcel_app/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> screens = const [
    MyParcelScreen(),
    SendParcelScreen(),
    Center(
      child: Text('Parcel Center'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        onPressed: () {
          NativeCommunication.openActivity();
        },
        child: Icon(
          Icons.chat_bubble,
        ),
      ),
    );
  }
}
