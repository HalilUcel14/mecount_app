import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_string.dart';
import 'core/constants/easy_locale.dart';
import 'core/extension/context_extension.dart';
import 'core/function/firebase_auth.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/theme_manager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Kurulum Komutları
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Firebase Setup
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Error Ekran Tasarımı İçin
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorMaterialWidget(
      details: details,
    );
  };
  // Sadece İnstance Oluşturur.
  DefaultFirebaseAuthHelper helper = DefaultFirebaseAuthHelper.instance;
  SharedManager sharedManager = SharedManager.instance;
  // AppBar Üzeri Mobil Gösterge ekran Tasarımı için
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  // Bu Bölüm Parça Parça Uzayacak
  // Provider , Easy Localization ve Diğerleri Şeklinde
  runApp(
    _easyLocalizationSetup(),
  );
}

EasyLocalization _easyLocalizationSetup() {
  return EasyLocalization(
    child: _multiProvider(),
    supportedLocales: [
      EasyLocaleConst.instance.enLocale,
      EasyLocaleConst.instance.trLocale,
    ],
    saveLocale: true,
    fallbackLocale: EasyLocaleConst.instance.enLocale,
    path: EasyLocaleConst.instance.localePath,
  );
}

MultiProvider _multiProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeManager.instance),
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.instance.appTitle,
      //  Easy Localization Setup Kodlar
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // İnternet Gittiğinde Ekranda Widget Oluşturan Yapı
      builder: (context, child) {
        return Stack(
          children: [
            child ?? const SizedBox(),
            const ConnectivityWidget(),
          ],
        );
      },
      // Theme Manager Dosyası ile Theme Getirir.
      theme: context.themeProvider,
      // Route Ayarları
      // Eğer Onboard Önceden Görüntülenmişse Login Sayfası Açılır Değil ise Onboard Açılır
      initialRoute:
          context.sharedManagerOnboard ? AppRoutes.login : AppRoutes.onboard,
      routes: AppRoutes.instance.routes,
    );
  }
}
