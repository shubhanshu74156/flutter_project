// https://m3.material.io/components/navigation-drawer/overview#1e63d958-6a22-4d3e-a33b-ff1449ba63b6
// 1 - standard navigation drawer
// opens on click of  icon of top app bar
// Top name contain -> Logo and Company name
// contain links-> Dashboard, Upcoming Events, My Connections, All Groups, Event Calendar

// drawer_example.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyLeftDrawer extends StatelessWidget {
  const MyLeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 100, // Set the desired height for the drawer header
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  // Your logo, you can replace the Icon with an Image if needed
                  Image(
                    image: AssetImage('images/logo.png'),
                    height: 48,
                    width: 48,
                  ),
                  SizedBox(
                    width: 16,
                  ), // Add some space between the logo and the title
                  Text(
                    'Rise Up India',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Dashboard'),
            onTap: () {
              context.go("/dashboard");
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Upcoming Event'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('My Connection'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('All Group'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Event Calendar'),
            onTap: () {
              context.go("/event-calender");
            },
          ),
        ],
      ),
    );
  }
}
