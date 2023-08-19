import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/srce/repository/authentication_repository/authentication_repository.dart';
import 'package:login_app/srce/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme, // Define your theme data here
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
      home: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text(".appable/")),
//       body: const Center(child: Text("Home Page"),),
//     );
//   }
// }

// Future<void> main() async {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//
//   // README(update[] -- GetX local Storege
//   // Todo: Add local Storege
//
//   /// -- README(Docs[1]) -- await Splash Until other items land
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//
//   /// -- README(Docs[2]) -- Initilze Firebase & Auth Repo
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
//
//   /// Main App Start here (app.dart)
//   runApp(App());
// }
