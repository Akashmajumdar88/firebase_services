import 'package:firebase_core/firebase_core.dart';
import 'package:firebse_ser/providers_demo/auth_provider.dart';
import 'package:firebse_ser/providers_demo/login_provider.dart';
import 'package:firebse_ser/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDGpVvix0bDyceDINXXDhaJzzQbTVQSrxo",
      appId: "1:1001512498454:android:0985186763d5221b6f8c37",
      messagingSenderId: "1001512498454",
      projectId: "buildthis-1af24",
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) =>Auth_Provider()..checkLoginStats()),
          ChangeNotifierProvider(create: (context) => LoginProvider()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      )
    );
  }
}


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//           apiKey: "AIzaSyDGpVvix0bDyceDINXXDhaJzzQbTVQSrxo",
//           appId: "1:1001512498454:android:0985186763d5221b6f8c37",
//           messagingSenderId: "1001512498454",
//           projectId: "buildthis-1af24",
//       ),
//     );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(430, 932),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Chats',
//         // home: LoginScreen(),
//         home: UsernameScreen(loginId: "6"),
//       ),
//     );
//   }
// }


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: "AIzaSyB5Qk4Dvskcatr2MtfOb-95QEsWlw1kTuw",
//       appId: "1:938147676435:android:4d5688263166eb0a0f5ae6",
//       messagingSenderId: "938147676435",
//       projectId: "chatapp-be54e",
//     ),
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // return BlocProvider(
//     //     create: (context) => CounterBloc(),
//     //   child: const MaterialApp(
//     //     home: EquatableTest(),
//     //   ),
//     // );
//     return MaterialApp(
//       title: 'Bloc State',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ChatScreen(username: "akash",currentUserEmail: "sda",),
//     );
//   }
// }
