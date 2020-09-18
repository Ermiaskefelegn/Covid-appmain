import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myapp1/pages/settings.dart';

class NotificationPlugin {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool monday, tuesday, wednsday, thursday, friday, saturday, sunday;
  int starthour = 0, endhour = 0, endmin = 0, startmin, min1, min2;
  var initSettings;

  NotificationPlugin._() {
    init();
  }

  init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializePlatformSpecifics();
    getstarthour().then(updatestarthour);
    getstartmin().then(updatestartmin);
    getendhour().then(updateenhour);
    getendmin().then(updateendmin);
    getminuteprefernce2().then(updatemin1);
  }

  initializePlatformSpecifics() {
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    initSettings = new InitializationSettings(android, iOS);
  }

  setOnnotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: (String payload) async {
      onNotificationClick(payload);
    });
  }

// *************************************************************************************************************************************************************
// *************************************************************************************************************************************************************

  void updatestarthour(int starth) {
    this.starthour = starth ?? 0;
  }

  void updatestartmin(int startm) {
    this.startmin = startm ?? 0;
  }

  void updateenhour(int endh) {
    this.endhour = endh ?? 0;
  }

  void updateendmin(int endm) {
    this.endmin = endm ?? 0;
  }

  void updatemin1(int min1) {
    this.min1 = min1 ?? 15;
  }

  void updatemin2(int min2) {
    this.min2 = min2 ?? 60;
  }

// *************************************************************************************************************************************************************
// *************************************************************************************************************************************************************
  Future<void> notification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'የኮቪድ-19 አስታዋሽ መልዕክት', 'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
//***************************************************************************************************************

  Future<void> onMonatGeton() async {
    var time = Time(starthour, startmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Monday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onMonatarrival() async {
    var timeofschedule =
        DateTime(starthour, startmin, 00).add(Duration(minutes: min2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(0, 'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', timeofschedule, platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onMonatGetoff() async {
    var time = Time(endhour, endmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Monday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

//***************************************************************************************************************

//***************************************************************************************************************

  Future<void> onTueatGeton() async {
    var time = Time(starthour, startmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Tuesday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onTueatarrival() async {
    var timeofschedule =
        DateTime(starthour, startmin, 00).add(Duration(minutes: min2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(0, 'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', timeofschedule, platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onTueatGetoff() async {
    var time = Time(endhour, endmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Tuesday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

//***************************************************************************************************************

//***************************************************************************************************************

  Future<void> onWedatGeton() async {
    var time = Time(starthour, startmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Wednesday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onWedatarrival() async {
    var timeofschedule =
        DateTime(starthour, startmin, 00).add(Duration(minutes: min2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(0, 'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', timeofschedule, platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onWedatGetoff() async {
    var time = Time(endhour, endmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Wednesday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

//***************************************************************************************************************

//***************************************************************************************************************

  Future<void> onThuatGeton() async {
    var time = Time(starthour, startmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Thursday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onThuatarrival() async {
    var timeofschedule =
        DateTime(starthour, startmin, 00).add(Duration(minutes: min2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(0, 'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', timeofschedule, platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onThuatGetoff() async {
    var time = Time(endhour, endmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Thursday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

//***************************************************************************************************************

//***************************************************************************************************************

  Future<void> onFriatGeton() async {
    var time = Time(starthour, startmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Friday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onFriatarrival() async {
    var timeofschedule =
        DateTime(starthour, startmin, 00).add(Duration(minutes: min2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(0, 'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', timeofschedule, platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onFriatGetoff() async {
    var time = Time(endhour, endmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Friday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

//***************************************************************************************************************

//***************************************************************************************************************

  Future<void> onSatatGeton() async {
    var time = Time(starthour, startmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Saturday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onSatatarrival() async {
    var timeofschedule =
        DateTime(starthour, startmin, 00).add(Duration(minutes: min2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(0, 'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', timeofschedule, platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onSatatGetoff() async {
    var time = Time(endhour, endmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Saturday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

//***************************************************************************************************************

//***************************************************************************************************************

  Future<void> onSunatGeton() async {
    var time = Time(9, 15, 0);
    var android = new AndroidNotificationDetails(
        'channel id 2', 'channel NAME 2', 'CHANNEL DESCRIPTION 2',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Sunday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<int> getpendingnotificationcaount() async {
    List<PendingNotificationRequest> p =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return p.length;
  }

  Future<void> onSunatarrival() async {
    var timeofschedule =
        DateTime(starthour, startmin, 00).add(Duration(minutes: min2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(0, 'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ', timeofschedule, platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

  Future<void> onSunatGetoff() async {
    var time = Time(endhour, endmin, 00);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        timeoutAfter: 5000,
        playSound: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        'የኮቪድ-19 አስታዋሽ መልዕክት',
        'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ',
        Day.Sunday,
        time,
        platform,
        payload:
            'ያስታውሱ የፊት ጭንብል በአግባቡ ማድርጎን ያረጋግጡ፤ሳኒታይዘር መጠቀሞን ወይም እጆዎን ይታጠቡ፤ርቀቶን መጠበቅም አይዘንጉ');
  }

//***************************************************************************************************************

}

NotificationPlugin notificationPlugin = NotificationPlugin._();
