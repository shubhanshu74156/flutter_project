import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up_media_mobile/src/views/widgets/bars/top_bar.dart';
import 'package:rise_up_media_mobile/src/views/widgets/drawers/left_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const MyAppBar(),
        drawer: const MyLeftDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profile_image.jpg'), // Replace with your profile image asset
              ),
              const SizedBox(height: 16),
              const Text(
                'John Doe', // Replace with user's name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'john.doe@example.com', // Replace with user's email
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Implement your logout logic here
                  context.go("/"); // Navigate back to the previous screen
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
