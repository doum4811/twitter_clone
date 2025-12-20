import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isReady = false;
  bool _isTaking = false;

  // FlashMode _flashMode = FlashMode.off;
  int _cameraIndex = 0;

  // FlashMode _flashMode = FlashMode.off; // ✅ late 금지. 기본값부터!
  // late FlashMode _flashMode;
  // ❌ late 제거
  FlashMode _flashMode = FlashMode.off;

  // late FlashMode _flashMode;
  // late CameraController _cameraController;
  @override
  void initState() {
    super.initState();
    _init();
  }

  // @override
  // void dispose() {
  //   _cameraController.dispose();
  //   super.dispose();
  // }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Future<void> _init() async {
  //   // 권한 요청 (카메라 / 사진)
  //   await Permission.camera.request();
  //   await Permission.photos.request(); // iOS
  //   // await Permission.storage.request(); // Android 일부 케이스

  //   try {
  //     _cameras = await availableCameras();
  //     if (_cameras.isEmpty) return;

  //     // _controller = CameraController(
  //     //   _cameras.first,
  //     //   ResolutionPreset.medium,
  //     //   enableAudio: false,
  //     // );
  //     // await _controller!.initialize();
  //     // _flashMode = _cameraController.value.flashMode;

  //     _controller = CameraController(
  //       _cameras[_cameraIndex],
  //       ResolutionPreset.medium,
  //       enableAudio: false,
  //     );
  //     await _controller!.initialize();
  //     _flashMode = _controller!.value.flashMode;
  //     // await _controller!.setFlashMode(_flashMode); // ✅ 초기 플래시 적용

  //     if (!mounted) return;
  //     setState(() => _isReady = true);
  //   } catch (e) {
  //     // 초기화 실패 시에도 갤러리 선택은 가능하니 화면은 유지
  //     if (!mounted) return;
  //     setState(() => _isReady = false);
  //   }
  // }
  Future<void> _init() async {
    await Permission.camera.request();
    await Permission.photos.request(); // iOS

    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) return;

      _controller = CameraController(
        _cameras[_cameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await _controller!.initialize();

      // ✅ initialize 이후에만 접근 가능
      _flashMode = _controller!.value.flashMode;

      // ✅ 원하는 초기 플래시(현재는 off) 적용
      await _controller!.setFlashMode(_flashMode);

      if (!mounted) return;
      setState(() => _isReady = true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isReady = false);
    }
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile == null) return;

    Navigator.of(context).pop(File(xfile.path));
  }

  Future<void> _takePhoto() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    if (_isTaking) return;

    setState(() => _isTaking = true);
    try {
      final XFile xfile = await _controller!.takePicture();
      if (!mounted) return;
      Navigator.of(context).pop(File(xfile.path));
    } finally {
      if (mounted) setState(() => _isTaking = false);
    }
  }

  // Future<void> _setFlashMode(FlashMode newFlashMode) async {
  //   await _cameraController.setFlashMode(newFlashMode);
  //   _flashMode = newFlashMode;
  //   setState(() {});
  // }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _controller?.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }
  // Future<void> _toggleFlash() async {
  //   if (_controller == null) return;

  //   setState(() {
  //     if (_flashMode == FlashMode.off) {
  //       _flashMode = FlashMode.auto;
  //     } else if (_flashMode == FlashMode.auto) {
  //       _flashMode = FlashMode.always;
  //     } else {
  //       _flashMode = FlashMode.off;
  //     }
  //   });

  //   await _controller!.setFlashMode(_flashMode);
  // }

  // Future<void> _toggleFlash() async {
  //   if (_controller == null || !_controller!.value.isInitialized) return;

  //   final next = switch (_flashMode) {
  //     FlashMode.off => FlashMode.auto,
  //     FlashMode.auto => FlashMode.always,
  //     _ => FlashMode.off, // always 포함
  //   };

  //   // setState(() => _flashMode = next);

  //   try {
  //     await _controller!.setFlashMode(next);
  //   } catch (_) {
  //     // 기기/환경에 따라 미지원일 수 있음(특히 시뮬레이터)
  //   }
  // }

  Future<void> _switchCamera() async {
    if (_cameras.isEmpty) return;
    if (_isTaking) return;

    // 다음 카메라로
    final nextIndex = (_cameraIndex + 1) % _cameras.length;
    setState(() {
      _isReady = false;
      _cameraIndex = nextIndex;
    });

    final old = _controller;
    _controller = null;
    await old?.dispose();

    try {
      final controller = CameraController(
        _cameras[_cameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      _controller = controller;
      await controller.initialize();
      await controller.setFlashMode(_flashMode); // ✅ 전환 후에도 플래시 상태 유지

      if (!mounted) return;
      setState(() => _isReady = true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isReady = false);
    }
  }

  Future<void> _toggleFlash() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    final next = (_flashMode == FlashMode.off)
        ? FlashMode.torch
        : FlashMode.off;

    try {
      await _controller!.setFlashMode(next);
      setState(() => _flashMode = next);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: _isReady && _controller != null
                  ? CameraPreview(_controller!)
                  : const Center(
                      child: Text(
                        "Camera not available.\nYou can still pick from gallery.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
            ),

            // 뒤로가기
            Positioned(
              left: 12,
              top: 12,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),

            // 하단 컨트롤 (Camera / Library)
            Positioned(
              left: 0,
              right: 0,
              bottom: 28,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     // // ✅ 왼쪽: Flash
                  //     // IconButton(
                  //     //   onPressed: _isReady ? _toggleFlash : null,
                  //     //   iconSize: 28,
                  //     //   // icon: Icon(
                  //     //   //   _flashMode == FlashMode.off
                  //     //   //       ? Icons.flash_off
                  //     //   //       : _flashMode == FlashMode.auto
                  //     //   //       ? Icons.flash_auto
                  //     //   //       : Icons.flash_on, //bolt
                  //     //   //   color: Colors.white,
                  //     //   // ),
                  //     //   icon: Icon(
                  //     //     _flashMode == FlashMode.off
                  //     //         ? Icons.flash_off
                  //     //         : Icons.flash_on,
                  //     //     color: Colors.white,
                  //     //   ),
                  //     // ),
                  //     // IconButton(
                  //     //   color: _flashMode == FlashMode.off
                  //     //       ? Colors.amber.shade200
                  //     //       : Colors.white,
                  //     //   onPressed: () => _setFlashMode(FlashMode.off),
                  //     //   icon: const Icon(Icons.flash_off_rounded),
                  //     // ),
                  //     // 셔터
                  //     GestureDetector(
                  //       onTap: _isReady ? _takePhoto : null,
                  //       child: Opacity(
                  //         opacity: _isReady ? 1 : 0.4,
                  //         child: Container(
                  //           width: 86,
                  //           height: 86,
                  //           decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             border: Border.all(color: Colors.white, width: 6),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(height: 18),
                  //     // // ✅ 오른쪽: Switch camera
                  //     IconButton(
                  //       onPressed: _isReady ? _switchCamera : null,
                  //       iconSize: 28,
                  //       //           icon: const Icon(
                  //       //   Icons.cameraswitch,
                  //       //   color: Colors.white,
                  //       // ),
                  //       icon: const Icon(
                  //         FontAwesomeIcons.repeat,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // IconButton(
                      //   onPressed: _isReady ? _toggleFlash : null,
                      //   icon: Icon(_flashIcon(), color: Colors.white),
                      // ),
                      // IconButton(
                      //   color: _flashMode == FlashMode.off
                      //       ? Colors.amber.shade200
                      //       : Colors.white,
                      //   onPressed: () => _setFlashMode(FlashMode.off),
                      //   icon: const Icon(Icons.flash_off_rounded),
                      // ),
                      IconButton(
                        onPressed: _isReady ? _toggleFlash : null,
                        icon: Icon(
                          _flashMode == FlashMode.off
                              ? Icons.flash_off_rounded
                              : Icons.flashlight_on_rounded,
                          color: _flashMode == FlashMode.off
                              ? Colors.white70
                              : Colors.amber.shade200,
                        ),
                      ),

                      GestureDetector(
                        onTap: _isReady ? _takePhoto : null,
                        child: Opacity(
                          opacity: _isReady ? 1 : 0.4,
                          child: Container(
                            width: 86,
                            height: 86,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 6),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _isReady ? _switchCamera : null,
                        icon: const Icon(
                          Icons.cameraswitch,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: _isReady ? null : null, // 현재 화면이 Camera
                        child: const Text(
                          "Camera",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: _pickFromGallery,
                        child: const Text(
                          "Library",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   CameraController? _controller;
//   List<CameraDescription> _cameras = [];
//   bool _isReady = false;
//   bool _isTaking = false;

//   bool _isSelfie = false; // ✅ 전/후면
//   FlashMode _flashMode = FlashMode.off; // ✅ late 금지. 기본값부터!

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     await Permission.camera.request();
//     await Permission.photos.request();

//     try {
//       _cameras = await availableCameras();
//       if (_cameras.isEmpty) return;

//       await _initController();

//       if (!mounted) return;
//       setState(() => _isReady = true);
//     } catch (_) {
//       if (!mounted) return;
//       setState(() => _isReady = false);
//     }
//   }

//   int _pickCameraIndex() {
//     final frontIndex = _cameras.indexWhere(
//       (c) => c.lensDirection == CameraLensDirection.front,
//     );
//     final backIndex = _cameras.indexWhere(
//       (c) => c.lensDirection == CameraLensDirection.back,
//     );

//     if (_isSelfie) return frontIndex != -1 ? frontIndex : 0;
//     return backIndex != -1 ? backIndex : 0;
//   }

//   Future<void> _initController() async {
//     final index = _pickCameraIndex();

//     final controller = CameraController(
//       _cameras[index],
//       ResolutionPreset.medium,
//       enableAudio: false,
//     );

//     await controller.initialize();
//     // ✅ initialize 이후에 flash 설정 가능
//     try {
//       await controller.setFlashMode(_flashMode);
//     } catch (_) {}

//     // 기존 컨트롤러 정리 후 교체
//     await _controller?.dispose();
//     _controller = controller;
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _pickFromGallery() async {
//     final XFile? xfile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (xfile == null) return;
//     if (!mounted) return;
//     Navigator.of(context).pop(File(xfile.path));
//   }

//   Future<void> _takePhoto() async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     if (_isTaking) return;

//     setState(() => _isTaking = true);
//     try {
//       final XFile xfile = await _controller!.takePicture();
//       if (!mounted) return;
//       Navigator.of(context).pop(File(xfile.path));
//     } finally {
//       if (mounted) setState(() => _isTaking = false);
//     }
//   }

//   Future<void> _toggleFlash() async {
//     if (_controller == null || !_controller!.value.isInitialized) return;

//     final next = switch (_flashMode) {
//       FlashMode.off => FlashMode.auto,
//       FlashMode.auto => FlashMode.always,
//       _ => FlashMode.off,
//     };

//     setState(() => _flashMode = next);

//     try {
//       await _controller!.setFlashMode(next);
//     } catch (_) {}
//   }

//   Future<void> _switchCamera() async {
//     if (_cameras.isEmpty) return;
//     if (_isTaking) return;

//     setState(() => _isReady = false);
//     _isSelfie = !_isSelfie;

//     try {
//       await _initController();
//     } finally {
//       if (mounted) setState(() => _isReady = true);
//     }
//   }

//   IconData _flashIcon() {
//     return _flashMode == FlashMode.off
//         ? Icons.flash_off_rounded
//         : _flashMode == FlashMode.auto
//         ? Icons.flash_auto_rounded
//         : Icons.flash_on_rounded;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: _isReady && _controller != null
//                   ? CameraPreview(_controller!)
//                   : const Center(
//                       child: Text(
//                         "Camera not available.\nYou can still pick from gallery.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//             ),

//             Positioned(
//               left: 12,
//               top: 12,
//               child: IconButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//               ),
//             ),

//             // ✅ 하단 컨트롤 (플래시/셔터/전환 + 라벨)
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 28,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                         onPressed: _isReady ? _toggleFlash : null,
//                         icon: Icon(_flashIcon(), color: Colors.white),
//                       ),
//                       GestureDetector(
//                         onTap: _isReady ? _takePhoto : null,
//                         child: Opacity(
//                           opacity: _isReady ? 1 : 0.4,
//                           child: Container(
//                             width: 86,
//                             height: 86,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.white, width: 6),
//                             ),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: _isReady ? _switchCamera : null,
//                         icon: const Icon(
//                           Icons.cameraswitch,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 18),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const Text(
//                         "Camera",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       TextButton(
//                         onPressed: _pickFromGallery,
//                         child: const Text(
//                           "Library",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
