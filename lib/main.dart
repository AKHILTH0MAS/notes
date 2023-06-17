import 'package:flutter/material.dart';
import 'package:notes/screens/addnote.dart';
import 'package:notes/screens/home.dart';
import 'package:provider/provider.dart';
import 'components/notesprovider.dart';
import 'components/preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/addnote': (context) => const AddNote(),
        },
        initialRoute: '/',
      ),
    );
  }
}
