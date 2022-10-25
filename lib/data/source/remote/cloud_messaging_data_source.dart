import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class IRemoteCloudMessagingDataSource {}

class RemoteCloudMessagingDataSource
    implements IRemoteCloudMessagingDataSource {}

Future<void> firebaseMessagingBackgroundHandlers(
    RemoteMessage remoteMessage) async {
  await Firebase.initializeApp();
}
