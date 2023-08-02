import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jack_albums/ui/album/models/albums_data.dart';
import 'package:jack_albums/ui/album/controller/albums_controller.dart';
import 'package:jack_albums/ui/album/list_albums_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const ProviderScope(child: MyApp()));
}

final albumsController = StateNotifierProvider<AlbumsController, AlbumsData?>(
  (ref) => AlbumsController(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jack's Albums",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(color: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const ListAlbumsScreen(),
    );
  }
}
