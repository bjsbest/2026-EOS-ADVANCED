import 'package:go_router/go_router.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/signup_screen.dart';
import '../views/friend/friend_list_screen.dart';
import '../views/friend/friend_calendar_screen.dart';
import '../views/home/home_screen.dart';
import '../models/user.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/friends',
      builder: (context, state) => FriendListScreen(),
      routes: [
        GoRoute(
          path: 'calendar',
          builder: (context, state){
            final friend = state.extra as User;
            return FriendCalendarScreen(friend: friend);
          },
        )
      ]
    )
  ]
);