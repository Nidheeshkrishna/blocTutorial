import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/CarasoulBloc/carasoul_bloc.dart';
import 'package:flutter_applicationgoogle_drive/Config/Route.dart';
import 'package:flutter_applicationgoogle_drive/Const/AppThemes.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamnavigationUi.dart';
import 'package:flutter_applicationgoogle_drive/Pages/bloc/bloc/notification_count_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/BottamNavigationBloc/bottam_navigation_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/CounterBloc/bloc/countre_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/NetWorkBloc/network_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/bloc/album_freezed_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/utilities/NavigationService.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:responsive_framework/responsive_framework.dart';

import 'bloc/AppDrawerBloc/appdrawer_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // const String dataBoxName = "data";
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  // Hive.registerAdapter(UserAdapter());
  // await Hive.openBox<HiveDataMain>(dataBoxName);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetIt locator = GetIt.instance;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late NavigationService navigationService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AlbumFreezedBlocBloc()),
        BlocProvider(create: (_) => CountreBlocBloc()),
        BlocProvider<NetworkBloc>(
          create: (context) => NetworkBloc()..add(ListenConnection()),
        ),
        BlocProvider(
            create: (context) =>
                BottamNavigationBlocBloc()..add(ChangePageEvent(0))),
        BlocProvider(create: (context) => AppdrawerBloc()),
        BlocProvider(create: (context) => NotificationCountBloc()),
        BlocProvider(
            create: (context) => CarasoulBloc()..add(CarasoulSuccEvent(0, ""))),
      ],
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          FlutterStatusbarcolor.setStatusBarColor(Colors.deepPurple);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, child) => ResponsiveWrapper.builder(
                    child,
                    maxWidth: 1200,
                    minWidth: 200,
                    defaultScale: true,
                    breakpoints: [
                      const ResponsiveBreakpoint.resize(200, name: MOBILE),
                      const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ],
                  ),
              onGenerateRoute: RouteGenerator.generateRoute,
              initialRoute: "/",
              title: 'Bloc Demo',
              themeMode: ThemeMode.system,
              darkTheme: AppTheme().getAppThemeDark(),
              theme: AppTheme().getAppThemeLight(),
              // CompleteDetailes()
              home: const HomePage(),
              navigatorKey: NavigationService.navigatorKey);
        });
      }),
    );
  }
}
