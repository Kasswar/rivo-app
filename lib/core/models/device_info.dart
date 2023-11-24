import 'package:flutter/cupertino.dart';

import '../enum/device_type.dart';

class DeviceInfo {
  Orientation? orientation;
  DeviceType? deviceType;
  double? screenWidth;
  double? screenHeight;
  double? localWidth;
  double? localHeight;

  DeviceInfo(
      {this.orientation,
      this.deviceType,
      this.screenWidth,
      this.screenHeight,
      this.localWidth,
      this.localHeight});
}
