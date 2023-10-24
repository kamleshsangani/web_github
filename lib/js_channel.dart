
import 'package:js/js.dart';

@JS('makeToast')
external void makeToast(String msg);


void sendToastMessage() {
  makeToast("This message is from flutter web");
}