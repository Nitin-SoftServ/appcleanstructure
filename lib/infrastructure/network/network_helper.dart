import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityController extends GetxController {
  var tag = "NetworkManager";
  var connectionType = 1;

  //Stream to keep listening to network change state
  StreamSubscription? _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _streamSubscription =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
          switch (status) {
            case InternetStatus.connected:
            // The internet is now connected
              connectionType = 1;
              update();
              break;
            case InternetStatus.disconnected:
            // The internet is now disconnected
              connectionType = 0;
              update();
              break;
            default:
            // The internet is now disconnected
              connectionType = 0;
              update();
              break;
          }
        });
  }



  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription!.cancel();
  }
}
