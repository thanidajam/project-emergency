import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:emer_projectnew/bodys/showemergen.dart';
import 'package:emer_projectnew/models/emergency_model.dart';
import 'package:emer_projectnew/models/user_model.dart';
import 'package:emer_projectnew/state/show_dataemer.dart';
import 'package:emer_projectnew/bodys/showdriperson.dart';
import 'package:emer_projectnew/utility/my_constant.dart';
import 'package:emer_projectnew/widgets/show_progress.dart';
import 'package:emer_projectnew/widgets/show_title.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverServer extends StatefulWidget {
  const DriverServer({Key? key}) : super(key: key);

  @override
  _DriverServerState createState() => _DriverServerState();
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notification', // title
    // 'This channel is used for importance notification' , // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

class _DriverServerState extends State<DriverServer> {
  List<Widget> widgets = [];
  int indexWidget = 0;
  UserModel? userModel;
  String name = 'ประวัติการแจ้งเหตุ';

  @override
  void initState() {
    super.initState();
    findUserModel();
    aboutNotification();
  }

  Future<Null> findUserModel() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    String? token = await FirebaseMessaging.instance.getToken();
    print('token == $token');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString('UID')!;

    if (uid != null && uid.isNotEmpty) {
      String url =
          '${MyConstant.domain}/emer_projectnew/api/EditTokenWhereID.php?isAdd=true&uid=$uid&Token=$token';
      await Dio().get(url).then((value) => print('Update Token Success!'));
    }

    print('## id Logined ==> $uid');

    String apiGetUserWhereUID =
        '${MyConstant.domain}/emer_projectnew/api/getUserWhereUID.php?isAdd=true&uid=$uid';
    await Dio().get(apiGetUserWhereUID).then((value) {
      print('value ==> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          widgets.add(ShowEmergen());
          widgets.add(ShowDripersons(userModel: userModel!));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, MyConstant.routeshowNotiEmer),
              icon: Icon(Icons.notifications))
        ],
        title: Text('$name'),
        backgroundColor: MyConstant.bg2,
      ),
      drawer: widgets.length == 0
          ? SizedBox()
          : Drawer(
              child: Stack(
                children: [
                  Column(
                    children: [
                      buildHead(),
                      menuDataEmer(),
                      menuDataperson(),
                      ShowSignOut(),
                    ],
                  )
                ],
              ),
            ),
      body: widgets.length == 0 ? ShowProgress() : widgets[indexWidget],
    );
  }

  UserAccountsDrawerHeader buildHead() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: MyConstant.bg2),
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage('${MyConstant.domain}${userModel?.image}'),
      ),
      accountName: Text(userModel == null ? 'Name ?' : userModel!.Name),
      accountEmail: Text(userModel == null ? 'Phone ?' : userModel!.Phone),
    );
  }

  ListTile menuDataEmer() {
    return ListTile(
      onTap: () {
        setState(() {
          name = 'ประวัติการแจ้งเหตุ';
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.history, size: 38),
      title: ShowTitle(
        title: 'ประวัติการแจ้งเหตุ',
        textStyle: MyConstant().h7Style(),
      ),
    );
  }

  ListTile menuDataperson() {
    return ListTile(
      onTap: () {
        setState(() {
          name = 'ข้อมูลส่วนตัว';
          indexWidget = 1;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.portrait, size: 38),
      title: ShowTitle(
        title: 'ข้อมูลส่วนตัว',
        textStyle: MyConstant().h7Style(),
      ),
    );
  }

  Future<Null> aboutNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              playSound: true,
              icon: '@mipmap/ambulance1',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
    });
  }
}

class ShowSignOut extends StatelessWidget {
  const ShowSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then((value) =>
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeUser, (route) => false));
          },
          leading: Icon(
            Icons.phonelink_erase_rounded,
            size: 36,
          ),
          title: ShowTitle(
            title: 'ออกจากระบบ',
            textStyle: MyConstant().h7Style(),
          ),
        ),
      ],
    );
  }
}
