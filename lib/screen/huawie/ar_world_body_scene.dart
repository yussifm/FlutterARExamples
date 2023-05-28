
import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class ArWorldBodyScene extends StatefulWidget {
  const ArWorldBodyScene({Key? key}) : super(key: key);

  @override
  State<ArWorldBodyScene> createState() => _ArWorldBodySceneState();
}

class _ArWorldBodySceneState extends State<ArWorldBodyScene> {
  late ARSceneController arSceneController;

  void _onARSceneCreated(ARSceneController controller) {
    debugPrint('ARScene created');
    arSceneController = controller;
    arSceneController.onDetectTrackable = (dynamic arBody) {
      _onDetectARWorldBody(arBody);
    };
    arSceneController.handleMessageData = (String text) {
      debugPrint('handleMessageData:$text');
    };
  }

  void _onDetectARWorldBody(ARBody arBody) {
    debugPrint('ARWorldBody detected: $arBody');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AREngineScene(
          ARSceneType.WORLD_BODY,
          ARSceneWorldBodyConfig(
            objPath: 'assets/bob.obj',
            texturePath: 'assets/bob_texture.png',
            // Label customization (Optional)
            colorFloor: Colors.brown,
            colorOther: Colors.red,
            colorTable: Colors.amber,
            colorSeat: Colors.blue,
            colorWall: Colors.green,
            colorBed: Colors.cyan,
            colorDoor: Colors.purple,
            colorWindow: Colors.orange,
            textFloor: 'Floor',
            textOther: 'Other',
            textSeat: 'Seat',
            textTable: 'Table',
            textWall: 'Wall',
            textBed: 'Bed',
            textDoor: 'Door',
            textWindow: 'Window',
            imageCeiling: 'assets/blue_texture.png',
            drawLabel: true,
          ),
          onArSceneCreated: _onARSceneCreated,
        ),
      ),
    );
  }
}
