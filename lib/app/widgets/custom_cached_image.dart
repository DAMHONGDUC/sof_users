
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sof_users/app/utils/extension.dart';
import 'package:sof_users/core/constants/app_endpoints.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_icon_size.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage(
      {super.key,
      this.imageURL,
      this.defaultWidget,
      this.headers,
      this.size = 50});

  final String? imageURL;
  final Widget? defaultWidget;
  final Map<String, String>? headers;
  final double size;

  @override
  Widget build(BuildContext context) {
    Widget buildPlaceholder() {
      return defaultWidget ??
          Icon(
            Icons.person,
            size: AppIconSize.large(),
            color: AppColors.icon_color,
          );
    }

    return SizedBox(
      width: size,
      height: size,
      child: imageURL.isNullOrEmpty
          ? buildPlaceholder()
          : CachedNetworkImage(
              imageUrl: imageURL!,
              placeholder: (context, url) => buildPlaceholder(),
              errorWidget: (context, url, error) => buildPlaceholder(),
              httpHeaders: headers ?? AppEndpoints.BASE_REQUEST_HEADER,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
    );
  }
}
