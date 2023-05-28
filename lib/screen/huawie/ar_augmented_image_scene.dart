
import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class ArAugmentedImageScene extends StatefulWidget {
  const ArAugmentedImageScene({Key? key}) : super(key: key);

  @override
  State<ArAugmentedImageScene> createState() => _ArAugmentedImageSceneState();
}

class _ArAugmentedImageSceneState extends State<ArAugmentedImageScene> {
  late ARSceneController arSceneController;

  void _onARSceneCreated(ARSceneController controller) {
    debugPrint('ARScene created');
    arSceneController = controller;
    arSceneController.onDetectTrackable = (dynamic arAugmentedImage) {
      _augmentedImageDetectCallback(arAugmentedImage);
    };
    arSceneController.handleMessageData = (String text) {
      debugPrint('handleMessageData:$text');
    };
  }

  void _augmentedImageDetectCallback(ARAugmentdImage arAugmentedImage) {
    debugPrint('ARAugmentdImage detected: $arAugmentedImage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AREngineScene(
          ARSceneType.AUGMENTED_IMAGE,
          ARSceneAugmentedImageConfig(
            augmentedImage: AugmentedImage(
              imgFileFromAsset: 'assets/image_default.png',
              widthInMeters: 0,
              imgName: 'Tech Park',
            ),
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
