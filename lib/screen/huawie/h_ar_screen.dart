import 'package:flu_ar_example/screen/huawie/ar_augmented_image_scene.dart';
import 'package:flu_ar_example/screen/huawie/ar_body_scene.dart';
import 'package:flu_ar_example/screen/huawie/ar_face_health_scene.dart';
import 'package:flu_ar_example/screen/huawie/ar_face_scene.dart';
import 'package:flu_ar_example/screen/huawie/ar_hand_scene.dart';
import 'package:flu_ar_example/screen/huawie/ar_scene_mesh_scene.dart';
import 'package:flu_ar_example/screen/huawie/ar_world_body_scene.dart';
import 'package:flu_ar_example/screen/huawie/ar_world_scene.dart';
import 'package:flutter/material.dart';
import 'package:huawei_ar/huawei_ar.dart';

class HuaweiARScreen extends StatefulWidget {
  const HuaweiARScreen({super.key});

  @override
  State<HuaweiARScreen> createState() => _HuaweiARScreenState();
}

class _HuaweiARScreenState extends State<HuaweiARScreen> {
  bool _isAREngineAPKReady = false;
  Color _serviceAppCheckColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _checkServiceApk();
  }

  void _checkServiceApk() async {
    if (!mounted) return;
    bool result = await AREngine.isArEngineServiceApkReady();
    setState(() {
      _isAREngineAPKReady = result;
      _serviceAppCheckColor = result ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Huawei AR Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
          _customContainer(
              _serviceAppCheckColor, "AREngine Service APK" "Ready", 5, false),
                _customContainer(
                        _serviceAppCheckColor,
                        _isAREngineAPKReady ? 'Yes' : 'No',
                        2,
                        true,
                      ),
                   
                  _expandedButton(
                    () => AREngine.navigateToAppMarketPage(),
                    'Navigate To AppGallery Page',
                    Icons.store,
                    color: Colors.black,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ArFaceScreen();
                        },
                      ),
                    ),
                    'ARFace Scene',
                    Icons.face,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ArHandScene();
                        },
                      ),
                    ),
                    'ARHand Scene',
                    Icons.pan_tool,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ArBodyScene();
                        },
                      ),
                    ),
                    'ARBody Scene',
                    Icons.accessibility,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ARWorldScene();
                        },
                      ),
                    ),
                    'ARWorld '
                    'Scene',
                    Icons.public,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ArAugmentedImageScene();
                        },
                      ),
                    ),
                    'ARAugmentedImage Scene',
                    Icons.image,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ArWorldBodyScene();
                        },
                      ),
                    ),
                    'ARWorldBody Scene',
                    Icons.accessibility,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ArFaceHealthScreen();
                        },
                      ),
                    ),
                    'FaceHealth Scene',
                    Icons.health_and_safety,
                  ),
                  _expandedButton(
                    () => Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) {
                          return const ArSceneMeshScene();
                        },
                      ),
                    ),
                    'ARSceneMesh Scene',
                    Icons.grid_on,
                  ),
              
                ],
              )),
    );
  }

  Widget _expandedButton(
    Function()? onPressed,
    String buttonText,
    IconData iconData, {
    Color? color,
  }) {
    return Flexible(
      flex: 2,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: MaterialButton(
            onPressed: onPressed,
            color: color ?? Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customContainer(
    Color borderColor,
    String text,
    int flex,
    bool reverseBorder,
  ) {
    if (reverseBorder) {
      return Flexible(
        flex: flex,
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.only(right: 5.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
            border: Border.all(color: _serviceAppCheckColor, width: 2.0),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      );
    }
    return Flexible(
      flex: flex,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
          ),
          border: Border.all(color: _serviceAppCheckColor, width: 2.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
