


import 'package:hba/view/screen/added/home_page.dart';
import 'package:hba/view/screen/added/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class InPage extends StatefulWidget {
  const InPage({super.key});

  @override
  State<InPage> createState() => _InPageState();
}

class _InPageState extends State<InPage> {
  int index =0;
  final screens =[
    const HomePage(),
    
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,

      body:screens[index] ,
      
      bottomNavigationBar: Container(
        color: const Color(0xFF003580),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
              backgroundColor: const Color(0xFF003580),
              color: Colors.white,
              activeColor: Colors.white,
              gap: 8,
              tabBackgroundColor: Colors.blue,
              padding: const EdgeInsets.all(13),
              selectedIndex: index,
              onTabChange: (index)=> setState(() =>
                this.index =index,),
             
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favourites',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ]
              ),
        ),
      ),
    );
  }
}


