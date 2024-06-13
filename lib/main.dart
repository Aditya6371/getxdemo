import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:getxdemo/Controller/theme_controller.dart';
import 'Controller/theme_controller.dart';
import 'screens/Homepage.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'GetX Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue.shade300,
//         ),
//         primaryColor: Colors.blue,
//         useMaterial3: true,
//         appBarTheme: AppBarTheme(
//             backgroundColor: Colors.blue.shade300,
//             titleTextStyle: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//             iconTheme: const IconThemeData(color: Colors.white),
//           ),
//           darkTheme: ThemeData.dark().copyWith(
//           useMaterial3: true,  // Enable Material Design 3 for dark theme as well
//           appBarTheme: AppBarTheme(
//             backgroundColor: Colors.grey.shade900,
//             titleTextStyle: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//       ),
//       home: const HomePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  final Theme_Controller themeController = Get.put(Theme_Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetX Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade300),
          primaryColor: Colors.blue,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.blue.shade400,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.grey.shade900,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        ),
        themeMode:
            themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
        home: const HomePage(),
      );
    });
  }
}
