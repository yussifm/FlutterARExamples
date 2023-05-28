
import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class ARWorldScene extends StatefulWidget {
  const ARWorldScene({Key? key}) : super(key: key);

  @override
  State<ARWorldScene> createState() => _ARWorldSceneState();
}

class _ARWorldSceneState extends State<ARWorldScene> {
  late ARSceneController arSceneController;

  void _onARSceneCreated(ARSceneController controller) {
    arSceneController = controller;
    arSceneController.onDetectTrackable = (dynamic arPlane) {
      _onDetectARPlane(arPlane);
    };
    arSceneController.handleMessageData = (String text) {
      debugPrint('handleMessageData:$text');
    };
  }

  void _onDetectARPlane(ARPlane arPlane) {
    debugPrint('ARPlane detected: $arPlane');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AREngineScene(
          ARSceneType.WORLD,
          ARSceneWorldConfig(
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
