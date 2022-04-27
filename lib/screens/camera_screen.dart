import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../constants/color_constants.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = '/camera';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  ArCoreController arCoreController;
  var selectedModel;

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context).settings.arguments as String;
    setState(() {
      selectedModel = name;
    });

    print("Selected Model");
    print(name);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kCardColor,
      //   actions: [
      //     IconButton(
      //         icon: Icon(Icons.info_outline),
      //       onPressed: (){},
      //     ),
      //     SizedBox(width: 10),
      //   ],
      // ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }

  // _onArCoreViewCreated(ArCoreController localController) {
  _onArCoreViewCreated(ArCoreController controller) {
    // controller = localController;
    arCoreController = controller;
    _onAddObject(arCoreController);
    // controller.onPlaneTap = _onPlaneTap;
  }

  // _onPlaneTap(List<ArCoreHitTestResult> hits) => _onHitDetected(hits.first);

  _onAddObject(ArCoreController controller) async {
    controller.addArCoreNode(
      ArCoreReferenceNode(
        // name: widget.selectedModel,
        name: selectedModel,
        // obcject3DFileName: widget.selectedModel + ".sfb",
        object3DFileName: selectedModel + ".sfb",
        position: vector.Vector3(0.0, -0.5, -2.0),
      ),
    );
  }


  // _onHitDetected(ArCoreHitTestResult plane) {
  //   controller.addArCoreNodeWithAnchor(
  //     ArCoreReferenceNode(
  //       name: widget.selectedModel,
  //       obcject3DFileName: widget.selectedModel + ".sfb",
  //       // position: plane.pose.translation,
  //       // rotation: plane.pose.rotation,
  //     ),
  //   );
  // }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
