library flutter_shake_widget;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({Key? key}) : super(key: key);

  @override
  _ShakeWidget createState() => _ShakeWidget();
}

class _ShakeWidget extends State<ShakeWidget> {
  /// 摇一摇弹窗
  bool isShowShakeModal = false;
  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      // 摇一摇阀值
      int value = 20;
      if (event.x.abs() >= value ||
          event.y.abs() >= value ||
          event.z.abs() >= value) {
        if (!isShowShakeModal) {
          isShowShakeModal = !isShowShakeModal;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('摇一摇'),
                  content: const Text('您摇动了屏幕'),
                  actions: [
                    CupertinoDialogAction(
                        child: const Text('确定'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        })
                  ],
                );
              }).then((value) => {
                if (value != null)
                  {
                    // 点击确定返回的业务逻辑
                    isShowShakeModal = false
                  }
                else
                  {isShowShakeModal = false}
              });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text('123');
  }
}
