import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:online_shop/data/source/remote/cloud_messaging_data_source.dart';

abstract class ICloudMessagingRepository {}

class CloudMessagingRepository implements ICloudMessagingRepository {
  final IRemoteCloudMessagingDataSource iRemoteCloudMessagingDataSource;
  CloudMessagingRepository(this.iRemoteCloudMessagingDataSource);
}
