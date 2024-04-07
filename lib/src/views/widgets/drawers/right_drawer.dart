// https://m3.material.io/components/navigation-drawer/overview#1e63d958-6a22-4d3e-a33b-ff1449ba63b6
// 1 - modal navigation drawer
// opens on click of user icon of top app bar
// contain links-> My Profile, Logout

// custom_menu_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePopupMenuButton extends StatelessWidget {
  const ProfilePopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
      offset: const Offset(0, 60),
      onSelected: (value) {
        // Handle menu item selection
        if (value == 1) {
          context.go("/profile");
        } else if (value == 2) {
          context.go("/");
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.grey,
              ),
              SizedBox(width: 8),
              Text('Profile Details'),
            ],
          ),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              Icon(
                Icons.exit_to_app,
                color: Colors.grey,
              ),
              SizedBox(width: 8),
              Text('Logout'),
            ],
          ),
        ),
      ],
    );
  }
}
