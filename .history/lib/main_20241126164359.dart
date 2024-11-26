import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/theme/app_theme.dart';
import 'helper/helper.dart';
import 'routes/app_pages.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
final StorageSession storageSession = StorageSession();
 storageSession.writeTokenJwt("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmU0MmJmM2NlYjBjM2JmZjU0YTZmYjUiLCJlbWFpbCI6ImluZm9AcHJpbXVzZS5uZXQiLCJuYW1lIjoiUHJpbXVzZSIsImFkbWluIjp0cnVlLCJwZXJtaXNzaW9ucyI6WyI2NzFmMGYwMjk4ZGE1YjcwZTk1NDNkZmEiLCI2NzFmMGYzNjk4ZGE1YjcwZTk1NDNkZmIiLCI2NzFmMGY0Nzk4ZGE1YjcwZTk1NDNkZmMiLCI2NzFmMGY1YTk4ZGE1YjcwZTk1NDNkZmUiLCI2NzFmMGY3Mzk4ZGE1YjcwZTk1NDNkZmYiLCI2NzFmMGY4Mzk4ZGE1YjcwZTk1NDNlMDAiLCI2NzFmMGZmMzk4ZGE1YjcwZTk1NDNlMDEiLCI2NzIwN2EzMTM1MjlhNzUxMjdhZWJiZjciLCI2NzI4NjhjZWUzODY5ZmE5OWRjODU2NGQiXSwiaWF0IjoxNzMyNjAyNTUzLCJleHAiOjE3MzMyMDczNTN9.hoIMF6vaHRLT7Dolqmqac1lQcef8EtBx1baXyXJIA2U");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const App());
  });
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Artist App",
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      // initialBinding: AuthBinding(),
    );
  }
}