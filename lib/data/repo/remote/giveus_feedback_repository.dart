import '../../../common/http_client.dart';
import '../../source/remote/giveus_feedback_data_source.dart';

final giveUsFeedBackReposioty = GiveUsFeedBackRepository(
    RemoteGiveUsFeedBackDataSource(httpClientsEmailSend));

abstract class IGiveUsFeedBackRepository {
  Future<int> sendGiveUsFeedBack(
      String email, String name, String subject, String message);
}

class GiveUsFeedBackRepository implements IGiveUsFeedBackRepository {
  IRemoteGiveUsFeedBackDataSource remoteGiveUsFeedBackDataSource;
  GiveUsFeedBackRepository(this.remoteGiveUsFeedBackDataSource);
  @override
  Future<int> sendGiveUsFeedBack(
      String email, String name, String subject, String message) {
    return remoteGiveUsFeedBackDataSource.sendGiveUsFeedBack(
        email, name, subject, message);
  }
}
