import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/CarasoulBloc/carasoul_bloc.dart';
import 'package:flutter_applicationgoogle_drive/Config/Route.dart';
import 'package:flutter_applicationgoogle_drive/Const/AppThemes.dart';
import 'package:flutter_applicationgoogle_drive/Pages/ImageCordinatePointer.dart';
import 'package:flutter_applicationgoogle_drive/Pages/MyBlocObserver.dart';
import 'package:flutter_applicationgoogle_drive/Pages/bloc/bloc/notification_count_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/BottamNavigationBloc/bottam_navigation_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/CounterBloc/bloc/countre_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/NetWorkBloc/network_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/bloc/FormvalidationBloc/bloc/my_form_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/bloc/album_freezed_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/utilities/NavigationService.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:responsive_framework/responsive_framework.dart';

import 'bloc/AppDrawerBloc/appdrawer_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: 'Sync_Channel',
        channelKey: 'Sync_Channel_key',
        channelName: 'Sync Notification',
        channelDescription: 'Notification channel for sync',
        defaultColor: Colors.pink,
        ledColor: Colors.red,
        importance: NotificationImportance.High),
  ]);
  // const String dataBoxName = "data";
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Hive.registerAdapter(UserAdapter());
  // await Hive.openBox<HiveDataMain>(dataBoxName);
  var initialRoute = '/page2';
  int i = 0;
  if (i == 0) {
    initialRoute = '/';
  }
  BlocOverrides.runZoned(
      () => runApp(MyApp(
            initialRoute: initialRoute,
          )),
      blocObserver: MyBlocObserver());
}

class MyApp extends StatefulWidget {
  final String initialRoute;
  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

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
        BlocProvider(create: (_) => MyFormBloc()),
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
              initialRoute: widget.initialRoute,
              title: 'Bloc Demo',
              themeMode: ThemeMode.system,
              darkTheme: AppTheme().getAppThemeDark(),
              theme: AppTheme().getAppThemeLight(),
              // CompleteDetailes()
              // Imagwithwatermark
              // WelcomeScreen   //****** */  Animation Demo//
//AuthPath()
              // HomePage
              //imagView_360
              // HeroFirstScreen ()
//HomePage(),
              //const AwesomeNotification(),
              // AppWidget

              //  home: const SimpleIsolate(),
              home: const ImageCordinatePointer(),
              navigatorKey: NavigationService.navigatorKey);
        });
      }),
    );
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    await Future.delayed(const Duration(seconds: 1));
    print('go!');

    FlutterNativeSplash.remove();

    //var isUserLoggedIn = await User.IsUserLoggedIn();
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }
}
