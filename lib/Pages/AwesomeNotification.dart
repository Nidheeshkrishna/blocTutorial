import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//             channelKey: 'key1',
//             channelName: 'Proto Coders Point',
//             channelDescription: "Notification example",
//             defaultColor: Color(0XFF9050DD),
//             ledColor: Colors.white,
//             playSound: true,
//             enableLights:true,
//             enableVibration: true
//         )
//       ]
//   );
//   runApp(AwesomeNotification());
// }

class AwesomeNotification extends StatefulWidget {
  const AwesomeNotification({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AwesomeNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await AwesomeNotifications().createNotification(
                    content: NotificationContent(
                  locked: true,
                  id: 0,
                  groupKey: 'Sync_Channel',
                  channelKey: 'Sync_Channel_key',
                  title: 'Syncing Data',
                  body: 'Your shop visit data is being synced.',
                  criticalAlert: true,
                  autoDismissible: false,
                )
                    //schedule: NotificationInterval(interval: 5,timeZone: timezom,repeats: false),
                    );
              },
              child: const Text("Local Notification"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    syncScheduler();
    super.initState();
  }

  void Notify() async {}

  Future<void> syncScheduler() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }
}
