// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:vector_math/vector_math_64.dart' as vector64;
//
//
// class ARAugmentedImagesScreen extends StatefulWidget {
//   const ARAugmentedImagesScreen({super.key});
//
//   @override
//   State<ARAugmentedImagesScreen> createState() => _ARAugmentedImagesScreenState();
// }
//
//
//
// class _ARAugmentedImagesScreenState extends State<ARAugmentedImagesScreen>
// {
//   ArCoreController? arCoreController;
//
//   whenArCoreViewCreated(ArCoreController coreController)
//   {
//     arCoreController = coreController;
//
//     arCoreController!.onPlaneTap = whenPlaneDetectedThenTap;
//   }
//
//   whenPlaneDetectedThenTap(List<ArCoreHitTestResult> tapsResult)
//   {
//     final tapPosition = tapsResult.first;
//
//     //display image
//     displayAugmentedImage(tapPosition);
//   }
//
//   displayAugmentedImage(ArCoreHitTestResult tapPosition) async
//   {
//     final bytesImage = (await rootBundle.load("images/captain.png")).buffer.asUint8List();
//
//     final imagePositionRotation = ArCoreNode(
//       image: ArCoreImage(bytes: bytesImage, width: 500, height: 500),
//       position: tapPosition.pose.translation + vector64.Vector3(0, 0, 0),
//       rotation: tapPosition.pose.rotation + vector64.Vector4(0, 0, 0, 0),
//     );
//
//     arCoreController!.addArCoreNodeWithAnchor(imagePositionRotation);
//   }
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//             "AR Augmented Images from Assets"
//         ),
//         centerTitle: true,
//       ),
//       body: ArCoreView(
//         enableTapRecognizer: true,
//         onArCoreViewCreated: whenArCoreViewCreated,
//       ),
//     );
//   }
// }

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ARGLBScreen extends StatefulWidget {
  const ARGLBScreen({Key? key}) : super(key: key);

  @override
  _ARGLBScreenState createState() => _ARGLBScreenState();
}

class _ARGLBScreenState extends State<ARGLBScreen> {
  ArCoreController? arCoreController;

  @override
  void dispose() {
    arCoreController?.dispose();
    super.dispose();
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addGLBNode();
  }

  void _addGLBNode() async {
    // Load GLB file
    final glbBytes = await rootBundle.load('images/lion_lowpoly.glb');

    // Create ArCoreNode with GLB material
    final glbNode = ArCoreReferenceNode(
      name: 'your_model',
      objectUrl: 'your_model.glb',
      scale: vector64.Vector3(1.0, 1.0, 1.0), // Adjust scale as needed
    );

    // Add the node to the scene
    arCoreController?.addArCoreNode(glbNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR with GLB'),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}

