// https://m3.material.io/components/top-app-bar/overview#10ddb237-3ff8-4304-89ff-4eee6bcd945c
// 1 - center aligned

import 'package:flutter/material.dart';
import 'package:rise_up_media_mobile/src/views/widgets/drawers/right_drawer.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Rise Up Media'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
      actions: const [
        ProfilePopupMenuButton(),
      ],
    );
  }
}
