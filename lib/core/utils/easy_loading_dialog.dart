import 'package:flutter_easyloading/flutter_easyloading.dart';

showLoading() {
  EasyLoading.show(status: 'loading...');
}

hideLoading() {
  // EasyLoading.addStatusCallback((status) {
    // if (status == EasyLoadingStatus.show) {
      EasyLoading.dismiss();
    // }
  // });
}
