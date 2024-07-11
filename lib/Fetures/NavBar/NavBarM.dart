import 'package:flutter/material.dart';
import '../addItem/addItem.dart';
import '../profile/profile.dart';
import '../record/record.dart';

class NavBarM extends StatefulWidget {
  const NavBarM({super.key});

  @override
  State<NavBarM> createState() => _NavBarMState();
}

class _NavBarMState extends State<NavBarM> {
  List destinations=[profile(),addItem(),record()];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        onDestinationSelected: (index)=>setState(() {selectedIndex=index;}),
        selectedIndex: selectedIndex,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.purpleAccent,
        backgroundColor: Colors.blueGrey.shade200,
        animationDuration: Duration(milliseconds: 2000),
        destinations: [
        NavigationDestination(icon: Icon(Icons.account_circle), label: "حسابي"),
        NavigationDestination(icon: Icon(Icons.add), label: "اضافة منتج"),
        NavigationDestination(icon: Icon(Icons.fiber_manual_record_sharp), label: "السجل"),
      ],),
      body: Center(
        child: destinations[selectedIndex],
      ),
    );
  }
}
