

import 'package:appstructureapp/infrastructure/api_provider/log.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';



class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      _initLog();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static _initLog() {
    Log.init();
    Log.setLevel(Level.ALL);
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
