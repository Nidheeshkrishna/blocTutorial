import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/AppDrawer.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamNavigatiionPage/BottamnavigationPages.dart';
import 'package:flutter_applicationgoogle_drive/bloc/BottamNavigationBloc/bottam_navigation_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final tabpages = [const Page1(), const Page2(), const Page3()];

//late BottamNavigationBlocBloc fetchindex;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    final box1 = await Hive.openBox('database');
    box1.put("name", "nidheesh");
    if (kDebugMode) {
      print(box1.get('name'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        bottomNavigationBar:
            BlocBuilder<BottamNavigationBlocBloc, BottamNavigationBlocState>(
                builder: (context, state) {
          if (state is BottomNavSuccess) {
            return BottomNavigationBar(
                selectedLabelStyle: const TextStyle(
                  fontSize: 9,
                  color: Color(0xff8b8b8b),
                  fontWeight: FontWeight.w600,
                  height: 1.3333333333333333,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 9,
                  color: Color(0xff8b8b8b),
                  fontWeight: FontWeight.w600,
                  height: 1.3333333333333333,
                ),
                items: const [
                  BottomNavigationBarItem(
                      label: 'Home', icon: Icon(Icons.home, size: 30)),
                  BottomNavigationBarItem(
                      label: 'share', icon: Icon(Icons.share, size: 30)),
                  BottomNavigationBarItem(
                      label: 'sell', icon: Icon(Icons.share, size: 30)),
                ],
                unselectedItemColor: const Color(0xff898989),
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: state.currentIndex,
                selectedItemColor: Colors.red,
                iconSize: 30,
                onTap: (index) {
                  BlocProvider.of<BottamNavigationBlocBloc>(context)
                      .add(ChangePageEvent(index));
                },
                elevation: 5);
          } else {
            return Container();
          }
        }),
        body: SafeArea(child:
            BlocBuilder<BottamNavigationBlocBloc, BottamNavigationBlocState>(
                builder: (context, state) {
          if (state is BottomNavSuccess) {
            return WillPopScope(
                onWillPop: () async {
                  if (state.currentIndex == 0) {
                    return true;
                  } else {
                    BlocProvider.of<BottamNavigationBlocBloc>(context)
                        .add(ChangePageEvent(0));
                    return false;
                  }
                },
                child: tabpages[state.currentIndex]);
          } else {
            return Container();
          }
        })));
  }
}
