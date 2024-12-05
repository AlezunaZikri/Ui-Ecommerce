import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/screens/splash/splash_screen.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/auth_provider.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'package:ui_ecommerce/state_managements/favorite_provider.dart';
import 'package:ui_ecommerce/state_managements/search_provider.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';
import 'package:ui_ecommerce/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => MainApp(isLoggedIn: isLoggedIn)
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder, // Tambahan Device Preview
        debugShowCheckedModeBanner: false,
        theme: themeData(theme.isDarkMode),
        home: isLoggedIn ? const HomeScreen() : const SplashScreen(),
        routes: routes,
      ),
    );
  }
}
