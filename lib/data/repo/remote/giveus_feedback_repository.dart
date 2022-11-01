import 'package:online_shop/data/source/remote/giveus_feedback_data_source.dart';

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
