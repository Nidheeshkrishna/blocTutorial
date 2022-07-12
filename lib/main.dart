import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Config/Route.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamnavigationUi.dart';
import 'package:flutter_applicationgoogle_drive/bloc/BottamNavigationBloc/bottam_navigation_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/NetWorkBloc/network_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'bloc/AppDrawerBloc/appdrawer_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkBloc>(
          create: (context) => NetworkBloc()..add(ListenConnection()),
        ),
        BlocProvider(
            create: (context) =>
                BottamNavigationBlocBloc()..add(ChangePageEvent(0))),
        BlocProvider(create: (context) => AppdrawerBloc()),
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: "/",
        title: 'Bloc Demo',
        themeMode: ThemeMode.system,
        darkTheme: darkTheme,
        theme: lightTheme,
        // CompleteDetailes()
        home: const HomePage(),
      ),
    );
  }

  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    // brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        // This will be applied to the "back" icon
        iconTheme: IconThemeData(color: Colors.red),
        // This will be applied to the action icon buttons that locates on the right side
        actionsIconTheme: IconThemeData(color: Colors.amber),
        centerTitle: false,
        elevation: 15,
        titleTextStyle: TextStyle(color: Colors.lightBlueAccent)),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.white),
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    //brightness: Brightness.light,
    backgroundColor: const Color.fromARGB(255, 224, 11, 11),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.greenAccent,
        // This will be applied to the "back" icon
        iconTheme: IconThemeData(color: Colors.red),
        // This will be applied to the action icon buttons that locates on the right side
        actionsIconTheme: IconThemeData(color: Colors.amber),
        centerTitle: false,
        elevation: 15,
        titleTextStyle: TextStyle(color: Colors.lightBlueAccent)),
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.black),
  );
}
