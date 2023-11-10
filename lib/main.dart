import 'package:flutter/material.dart';
import 'package:nsqv/widgets/home/home_screen.dart';
import 'package:flutter/services.dart';

var kColorSchema = ColorScheme.fromSeed(seedColor: Colors.indigo);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const NsqvApp()));
}

class NsqvApp extends StatelessWidget {
  const NsqvApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qué veo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: kColorSchema,
          useMaterial3: true,
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData().copyWith(
            backgroundColor: kColorSchema.primary,
            selectedItemColor: kColorSchema.onPrimary,
            unselectedItemColor: kColorSchema.inversePrimary,
          ),
        ),
        home: const HomeScreen());
  }
}
