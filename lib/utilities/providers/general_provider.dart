import 'package:flutter/foundation.dart';
import 'package:tinder_clone/utilities/providers/registration_provider.dart';
import 'main_screen_provider.dart';
import 'providers.dart';

class GeneralProvider with ChangeNotifier {
  late MainScreenProvider mainScreenProvider;
  late RegistrationProvider registrationProvider;

  GeneralProvider(){
    mainScreenProvider = MainScreenProvider(notifyListeners: notifyListenersCallBack);
    registrationProvider = RegistrationProvider(notifyListeners: notifyListenersCallBack);
  }

  void notifyListenersCallBack(){
    notifyListeners();
  }
}