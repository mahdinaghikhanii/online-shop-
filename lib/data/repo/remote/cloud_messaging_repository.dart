import '../../source/remote/cloud_messaging_data_source.dart';

abstract class ICloudMessagingRepository {}

class CloudMessagingRepository implements ICloudMessagingRepository {
  final IRemoteCloudMessagingDataSource iRemoteCloudMessagingDataSource;
  CloudMessagingRepository(this.iRemoteCloudMessagingDataSource);
}
