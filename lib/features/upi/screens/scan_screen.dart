import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}class _ScanScreenState extends State<ScanScreen> with SingleTickerProviderStateMixin {
  bool isFlashOn = false;
  final MobileScannerController cameraController = MobileScannerController();
  late AnimationController _animationController;
  late Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scanAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera Preview
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final barcode = capture.barcodes.first;
              final String? code = barcode.rawValue;
              if (code != null) {
                debugPrint('QR Code found: $code');
                cameraController.pause();
              }
            },
          ),

          // AppBar
          Positioned(
            top: 60,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BackButton(color: Colors.white),
                Text(
                  "Scan any QR Code",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(width: 48),
              ],
            ),
          ),

          // Scanner box with animated scanning line
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _scanAnimation,
                      builder: (context, child) {
                        return Positioned(
                          top: 250 * _scanAnimation.value - 15, // line height offset
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.blue.withOpacity(0.5),
                                  Colors.transparent
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: 40,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.white),
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                    if (image != null) {
                      File pickedFile = File(image.path);
                      // Use `pickedFile` as needed, e.g. display it or scan the QR
                      print('Picked image: ${pickedFile.path}');
                    } else {
                      print('No image selected.');
                    }
                  },
                ),

                IconButton(
                  icon: Icon(
                    isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() => isFlashOn = !isFlashOn);
                    cameraController.toggleTorch();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
