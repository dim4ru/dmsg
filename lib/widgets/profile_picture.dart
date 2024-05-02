import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class ProfilePicture extends GetWidget {
  static double iconSize = 18;
  final String? url;

  ProfilePicture({required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: iconSize,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(iconSize),
        child: (url == null || url == "")
            ? null
            : OctoImage(
          image: CachedNetworkImageProvider(url!),
          placeholderBuilder:
          OctoPlaceholder.circularProgressIndicator(),
          errorBuilder: OctoError.icon(color: Colors.black),
        ),
      ),
    );
  }
}