import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_display_app/View/load_image_file.dart';
import 'package:image_display_app/View/make_image_file.dart';
import 'package:image_display_app/View/read_base64_dcm.dart';
import 'package:image_display_app/View/read_base64_dcm_window.dart';
import 'package:image_display_app/View/read_base64_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const LoadImageFile(),
                ),
                child: const Text('Load Image File'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const MakeImageFile(),
                ),
                child: const Text('Make Image File'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const ReadBase64Image(),
                ),
                child: const Text('Read Base64 Image'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const ReadBase64Dcm(),
                ),
                child: const Text('Read Base64 DCM'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => const ReadBase64DcmWindow(),
                ),
                child: const Text('Read Base64 DCM-Window'),
              ),
            ),
          ],
        ),
      ),
    );
  }
} // End
