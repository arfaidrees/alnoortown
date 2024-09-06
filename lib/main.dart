import 'package:al_noor_town/Screens/home_page.dart';
import 'package:al_noor_town/Screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'Screens/Building Work/building_work_navigation.dart';
import 'Screens/Development Work/development_page.dart';
import 'Screens/Material Shifting/material_shifting.dart';
import 'Screens/New Material/new_material.dart';
import 'Screens/login_page.dart';
import 'ViewModels/all_noor_view_model.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(
    Phoenix(
    child:EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ur'),
        Locale('fr'),
        Locale('ru'),
        Locale('de'),
        Locale('zh'),
        Locale('ar'),
      ],
      path: 'assets/langs', // Path to your language files
      fallbackLocale: const Locale('en'), // Default language
      child: MyApp(), // Separate widget to keep the code clean
    ),
  )
  );
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final prefs = await SharedPreferences.getInstance();
    final isClockedIn = prefs.getBool('isClockedIn') ?? false;
    if (isClockedIn) {
      final startTime = DateTime.parse(prefs.getString('startTime')!);
      final duration = DateTime.now().difference(startTime);
      final formattedDuration = duration.toString().split('.').first.padLeft(8, "0");

      // Update the notification with the current timer value
      HomeController().showRunningTimerNotification(formattedDuration);
    }
    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () =>  HomePage()),
        GetPage(name: '/development', page: () =>  DevelopmentPage()),
        GetPage(name: '/materialShifting', page: () =>  MaterialShiftingPage()),
        GetPage(name: '/newMaterial', page: () => NewMaterial()),
        GetPage(name: '/buildingWork', page: () => Building_Navigation_Page()),
      ],
    );
  }
}
