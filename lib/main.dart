import 'package:fitlytic/UI/auth/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1F2937),
        scaffoldBackgroundColor: const Color(0xFF111827),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3B82F6),
          secondary: Color(0xFF3B82F6),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
      home: LoginPage(),
    );
  }
}

// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomePage();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'notifications',
//           builder: (BuildContext context, GoRouterState state) {
//             return const Notifications();
//           },
//         ),
//       ],
//     ),
//   ],
// );
