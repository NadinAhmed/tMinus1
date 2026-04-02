import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CoinIcon extends StatelessWidget {
  final String iconUrl;

  const CoinIcon({super.key, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: iconUrl,
        placeholder: (context, url) =>
            SvgPicture.asset("assets/svg/logo.svg"),
        errorWidget: (context, url, error) =>
            SvgPicture.asset("assets/svg/logo.svg"),
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }
}
