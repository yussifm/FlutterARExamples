import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;


class GoogleArScreen extends StatefulWidget {
  const GoogleArScreen({super.key});

  @override
  State<GoogleArScreen> createState() => _GoogleArScreenState();
}

class _GoogleArScreenState extends State<GoogleArScreen> {
  ArCoreController _arCoreController = ArCoreController(id: 1);

  @override
  void dispose() {
    _arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google AR "),
        centerTitle: true,
      ),
      body: ArCoreView(onArCoreViewCreated: _onArcoreViewCreated),
    );
  }

  _onArcoreViewCreated(ArCoreController arCoreController) {
    _arCoreController = arCoreController;

    _addCube(arCoreController);
  }

   void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: const Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }
}
