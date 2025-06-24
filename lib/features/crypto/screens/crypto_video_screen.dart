import 'package:biopay_mobile/router/routes.dart';
import 'package:biopay_mobile/utils/size_utils.dart';
import 'package:biopay_mobile/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class CryptoVideoScreen extends StatefulWidget {
  const CryptoVideoScreen({super.key});

  @override
  State<CryptoVideoScreen> createState() => _CryptoVideoScreenState();
}

class _CryptoVideoScreenState extends State<CryptoVideoScreen> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    )..initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //
  //   videoController = VideoPlayerController.networkUrl(
  //     Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  //   )
  //     ..initialize().then((_) {
  //       setState(() {});
  //     });
  // }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  Widget _buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: videoController.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(videoController),
          if (!videoController.value.isPlaying)
            IconButton(
              icon: const Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
              onPressed: () {
                setState(() {
                  videoController.play();
                });
              },
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Getting Started with Crypto',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to Add Crypto to Your MetaMask Wallet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Watch this short video to learn how crypto payments work in our app.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Colors.black,
                height: 220,
                child: videoController.value.isInitialized
                    ? _buildVideoPlayer()
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child : SizedBox(
                width: double.infinity,
                child: CustomFilledButton(
                  onPressed: () {
                    context.push(Routes.cryptoWalletSetupScreen);
                  },
                  title: 'Continue',
                  width: SizeUtils.screenWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
