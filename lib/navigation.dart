import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up_media_mobile/src/views/login/login_test_view.dart';
import 'package:rise_up_media_mobile/src/views/menu/dashboard.dart';
import 'package:rise_up_media_mobile/src/views/menu/details.dart';
import 'package:rise_up_media_mobile/src/views/menu/event_calender.dart';
import 'package:rise_up_media_mobile/src/views/menu/profile.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: "login",
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Login_Test_ViewState());
      },
    ),
    GoRoute(
      name: "profile",
      path: '/profile',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ProfileScreen());
      },
    ),
    GoRoute(
      name: "dashboard",
      path: '/dashboard',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Dashboard());
      },
    ),
    GoRoute(
      name: "event-calender",
      path: '/event-calender',
      pageBuilder: (context, state) {
        return const MaterialPage(child: EventCalender());
      },
    ),
    GoRoute(
      name: "details",
      path: '/details',
      pageBuilder: (context, state) {
        return MaterialPage(
            child: CardDetails(
          myObject: state.extra as Map<String, String>,
        ));
      },
    ),
  ],
);

class MyRoutes extends StatelessWidget {
  const MyRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
