
import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class ArSceneMeshScene extends StatefulWidget {
  const ArSceneMeshScene({Key? key}) : super(key: key);

  @override
  State<ArSceneMeshScene> createState() => _ArSceneMeshSceneState();
}

class _ArSceneMeshSceneState extends State<ArSceneMeshScene> {
  late ARSceneController arSceneController;

  void _onARSceneCreated(ARSceneController controller) {
    debugPrint('ARScene created');
    arSceneController = controller;
    arSceneController.handleMessageData = (String text) {
      debugPrint('handleMessageData:$text');
    };
    arSceneController.sceneMeshDrawFrame = (ARSceneMesh arSceneMesh) {
      debugPrint('sceneMeshDrawFrame: $arSceneMesh');
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AREngineScene(
          ARSceneType.SCENE_MESH,
          ARSceneMeshConfig(
            objPath: 'assets/blub.obj',
            texturePath: 'assets/blub_texture.png',
          ),
          onArSceneCreated: _onARSceneCreated,
        ),
      ),
    );
  }
}
