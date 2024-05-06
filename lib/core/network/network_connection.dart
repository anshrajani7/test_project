import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';

import '../app_export.dart';

class NetworkConnection extends GetxController{
  Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  var connectionResult = ConnectivityResult.none;

  @override
  void onInit() async {
    super.onInit();
    await initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription!.cancel();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    _updateConnectionStatus(result);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    // setState(() {
    connectionStatus.value = result;
    // });
  }

  internetAlertDialog({required BuildContext context}) {
    return showDialog(
      // barrierDismissible: true,
      context: context,
      builder: (context) {
        return const AlertDialog(
          // backgroundColor: CustomColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          title: Icon(Icons.wifi_off_rounded, size: 50),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppString.noInterNet,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  //color: CustomColor.themeColor.value,
                ),
              ),
              SizedBox(height: 15),
              Text(
               AppString.networkErrorMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  // color: CustomColor.black.value,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}