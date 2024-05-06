import 'package:test_project/core/network/network_connection.dart';

import '../../app_export.dart';

class BindingsService extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkConnection(), permanent: true);
  }
}