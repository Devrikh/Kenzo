import 'package:flutter/material.dart';
import 'package:my_app/Profile/profile.dart';
import 'package:my_app/emotionPage.dart';
import 'package:my_app/food/meal_sec.dart';
import 'package:my_app/main_page/MainPage.dart';
import 'package:my_app/pages/login_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
          onDetailsPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            accountName: Text(
              'Devrikh Jatav',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              "ChippiChippiChappa@boomboom.com",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              
              child: ClipOval(
                
                child: Image.network(
                  'https://i.ytimg.com/vi/wh9QLjk3M2k/maxresdefault.jpg',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(),
              color: Colors.blue,
              image: DecorationImage(
                
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5u7WczUK8H2mEJwC0nQQHs2dqdrKbPmlELA&usqp=CAU',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Meal'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => meals_page()),
                );
              },
          ),
          ListTile(
            leading: Icon(Icons.medication_outlined),
            title: Text('Medicines'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.emoji_emotions),
            title: Text('Mental Care'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => emotionpage()),
                );
              },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
          ),
        ],
      ),
    );
  }
}
