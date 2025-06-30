import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tornet/core/common/widgets/app_loading_indicator.dart';

class AppAuthenticatedImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;

  const AppAuthenticatedImage({
    super.key,
    required this.imageUrl,
    this.width = 60,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty || imageUrl == '') {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: SvgPicture.asset(
          'assets/icons/svg/image-placeholder.svg',
          width: width,
          height: height,
        ),
      );
    }

    return FutureBuilder<String?>(
      future: Future.value(''),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) => SvgPicture.asset(
                'assets/icons/svg/image-placeholder.svg',
                fit: BoxFit.fill,
                width: width,
                height: height,
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return AppLoadingIndicator();
              },
              imageUrl!,
              headers: {
                'Authorization': 'Bearer ${snapshot.data}',
              },
              fit: BoxFit.fill,
              width: width,
              height: height,
            ),
          ),
        );
      },
    );
  }
}