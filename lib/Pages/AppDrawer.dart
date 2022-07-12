import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/bloc/AppDrawerBloc/appdrawer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocdata = BlocProvider.of<AppdrawerBloc>(context);
    return BlocBuilder<AppdrawerBloc, AppdrawerState>(
      builder: (context, state) {
        return BlocConsumer<AppdrawerBloc, AppdrawerState>(
          listener: (context, state) {
            if (state is HomePageState) {
              Navigator.pushNamed(context, "/page3");
            }
            if (state is TestPageState) {
              Navigator.pushNamed(context, "/page2");
            }
          },
          builder: (context, state) {
            if (state is AppdrawerInitial) {
              return Scaffold(
                body: Drawer(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: <Widget>[
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Expanded(
                            child: ListView(
                              padding: const EdgeInsets.only(top: 8.0),
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.group),
                                  title: const Text("Sample Page"),
                                  onTap: () {
                                    blocdata.add(SamplePageEvent());
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.group),
                                  title: const Text("Home"),
                                  onTap: () {
                                    blocdata.add(HomePageEvent());
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.exit_to_app),
                                  title: const Text('Logout'),
                                  onTap: () {
                                    // context
                                    //     .bloc<AuthenticationBloc>()
                                    //     .add(AuthenticationLogoutRequested());
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Drawer(
                child: Column(
                  children: <Widget>[
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Expanded(
                        child: ListView(
                          padding: const EdgeInsets.only(top: 8.0),
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.group),
                              title: const Text("Sample Page"),
                              onTap: () {
                                blocdata.add(SamplePageEvent());
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.group),
                              title: const Text("Home"),
                              onTap: () {
                                blocdata.add(HomePageEvent());
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.exit_to_app),
                              title: const Text('Logout'),
                              onTap: () {
                                // context
                                //     .bloc<AuthenticationBloc>()
                                //     .add(AuthenticationLogoutRequested());
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}
