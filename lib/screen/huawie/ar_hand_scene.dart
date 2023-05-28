

import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class ArHandScene extends StatefulWidget {
  const ArHandScene({Key? key}) : super(key: key);

  @override
  State<ArHandScene> createState() => _ArHandSceneState();
}

class _ArHandSceneState extends State<ArHandScene> {
  String detectionResult = '';
  bool _showLogs = false;

  late ARSceneController arSceneController;
  Alignment _alignment = Alignment.centerLeft;

  void _onARSceneCreated(ARSceneController controller) {
    debugPrint('ARScene created');
    arSceneController = controller;
    arSceneController.onDetectTrackable = (dynamic arHand) {
      _handDetectCallback(arHand);
    };
    arSceneController.handleMessageData = (String text) {
      debugPrint('handleMessageData: $text');
    };
    arSceneController.handleCameraConfigData = (ARCameraConfig cameraConfig) {
      debugPrint('handleCameraConfigData: $cameraConfig');
    };

    arSceneController.handleCameraIntrinsicsData =
        (ARCameraIntrinsics cameraIntrinsics) {
      debugPrint('handleCameraIntrinsicsData: $cameraIntrinsics');
    };
  }

  void _handDetectCallback(ARHand arHand) {
    if (!mounted) return;
    setState(() {
      detectionResult = arHand.toString();
      switch (arHand.gestureType) {
        case -1:
          _alignment = Alignment.center;
          break;
        case 0:
          _alignment = Alignment.centerRight;
          break;
        case 1:
          _alignment = Alignment.bottomCenter;
          break;
        case 6:
          _alignment = Alignment.centerLeft;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AREngineScene(
              ARSceneType.HAND,
              ARSceneHandConfig(
                enableBoundingBox: true,
                boxColor: Colors.green,
                lineWidth: 15.0,
              ),
              onArSceneCreated: _onARSceneCreated,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showLogs = !_showLogs;
                  });
                },
                child: Text("${_showLogs ? "Disable" : "Enable"} Logs"),
              ),
            ),
            _showLogs ? Text(detectionResult) : const SizedBox.shrink(),
            AnimatedContainer(
              alignment: _alignment,
              duration: const Duration(milliseconds: 100),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.amber,
                child: const Center(
                  child: Text(
                    'Move Me',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
