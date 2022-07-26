import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/DataModel.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/jsonData.dart';
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
  late Box<HiveData> box1;
  int pageIndex = 0;
  final tabpages = [const Page1(), const Page2(), const Page3()];

//late BottamNavigationBlocBloc fetchindex;
  @override
  void initState() {
    super.initState();

    // //var john = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    // //var john2 = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    // if (kDebugMode) {
    //   print(john.age);
    // }
    createBox();
    //getHiveModel();
    //getdata();
  }

  getHiveModel() async {
    box1 = await Hive.openBox('data');
    // if (kDebugMode)
    //   print(box1.values.first.result.n);
    // }
  }

  // getdata() async {

  //   final box1 = await Hive.openBox('database');
  //   box1.put("name", "nidheesh");
  //   if (kDebugMode) {
  //     print(box1.get('name'));
  //   }
  // }

  Future<void> createBox() async {
    Hive.registerAdapter(UserAdapter());
    box1 = await Hive.openBox('data');
    // box1.clear();
    if (box1.isEmpty) {
      HiveDataMain hiveData = await getData();
      //final Map<String, dynamic> decoded = jsonDecode((json.result).toString());

      box1.addAll(hiveData.result);
      final r = box1.get(0);
      if (kDebugMode) {
        print(r);
      }
    } else {
      var hiveData = box1.get(0);
      if (kDebugMode) {
        print(hiveData!.firstNmae);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //appBar: AppBar(title: const Text("Home Page")),
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
                  label: 'shop', icon: Icon(Icons.shop, size: 30)),
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
    }), body: SafeArea(child:
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
