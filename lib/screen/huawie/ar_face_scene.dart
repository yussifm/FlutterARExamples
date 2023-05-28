

import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class ArFaceScreen extends StatefulWidget {
  const ArFaceScreen({Key? key}) : super(key: key);

  @override
  State<ArFaceScreen> createState() => _ArFaceScreenState();
}

class _ArFaceScreenState extends State<ArFaceScreen> {
  late ARSceneController arSceneController;

  void _onSceneCreated(ARSceneController controller) {
    debugPrint('ARScene created');
    arSceneController = controller;
    arSceneController.onDetectTrackable = (dynamic arFace) {
      _faceDetectCallback(arFace);
    };
    arSceneController.handleMessageData = (String text) {
      debugPrint('handleMessageData:$text');
    };
  }

  void _faceDetectCallback(ARFace arFace) {
    debugPrint('ARFace detected: $arFace');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AREngineScene(
          ARSceneType.FACE,
          ARSceneFaceConfig(
            pointSize: 5.0,
            depthColor: Colors.amber,
            // Texture will override the color if specified
            // texturePath: 'assets/blue_texture.png',
            drawFace: true,
          ),
          onArSceneCreated: _onSceneCreated,
        ),
      ),
    );
  }
}
