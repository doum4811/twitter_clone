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

  int _cameraIndex = 0;

  FlashMode _flashMode = FlashMode.off;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    await Permission.camera.request();
    await Permission.photos.request(); // iOS
    // await Permission.storage.request(); // Android 일부 케이스

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

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _controller?.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
