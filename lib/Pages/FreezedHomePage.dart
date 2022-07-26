import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/BusinessModel/BusinessDataModel.dart';
import 'package:flutter_applicationgoogle_drive/utilities/ExceptionHandling.dart';

class FreezedHomePage extends StatefulWidget {
  const FreezedHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FreezedHomePage> {
  final Dio dio = Dio();
  List<User> _users = [];

  Future<void> fetchUsers() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );
      if (kDebugMode) {
        print(response.data);
      }
      final List list = response.data;

      setState(() {
        _users = list.map((e) => User.fromJson(e)).toList();
      });
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];

          return ListTile(
            title: Text(user.username),
            subtitle: Text(user.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        tooltip: 'Fetch Users',
        child: const Icon(Icons.data_usage),
      ),
    );
  }
}
