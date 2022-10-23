import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocalImageService extends StatelessWidget {
  final bool imageSvgOrAnutherVersion;
  final BorderRadius? borderRadius;
  final String localImageAddres;
  const LocalImageService(
      {super.key,
      required this.localImageAddres,
      this.borderRadius,
      required this.imageSvgOrAnutherVersion});

  @override
  Widget build(BuildContext context) {
    if (imageSvgOrAnutherVersion == true) {
      return SvgPicture.asset(localImageAddres);
    } else {
      if (borderRadius == null) {
        return Image.asset(
          localImageAddres,
          fit: BoxFit.cover,
        );
      } else {
        return ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(
              localImageAddres,
              fit: BoxFit.cover,
            ));
      }
    }
  }
}
