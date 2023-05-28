
import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class ArBodyScene extends StatefulWidget {
  const ArBodyScene({Key? key}) : super(key: key);

  @override
  State<ArBodyScene> createState() => _ArBodySceneState();
}

class _ArBodySceneState extends State<ArBodyScene> {
  late ARSceneController arSceneController;

  void _onARSceneCreated(ARSceneController controller) {
    arSceneController = controller;
    arSceneController.onDetectTrackable = (dynamic arBody) {
      _bodyDetectCallback(arBody);
    };
    arSceneController.handleMessageData = (String text) {
      debugPrint('handleMessageData:$text');
    };
  }

  void _bodyDetectCallback(ARBody arBody) {
    debugPrint('ARBody detected: $arBody');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AREngineScene(
          ARSceneType.BODY,
          ARSceneBodyConfig(
            drawLine: true,
            drawPoint: true,
            lineWidth: 10.0,
            pointSize: 20.0,
            lineColor: Colors.green,
            pointColor: Colors.amber,
          ),
          onArSceneCreated: _onARSceneCreated,
        ),
      ),
    );
  }
}
