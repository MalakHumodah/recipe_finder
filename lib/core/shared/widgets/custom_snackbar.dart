import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_finder/core/shared/widgets/content_type.dart';

import '../../constants/assets_path.dart';

class AwesomeSnackbarContent extends StatelessWidget {
  final String title;
  final String message;
  final Color? color;
  final ContentType contentType;
  final bool inMaterialBanner;
  final double? titleFontSize;
  final double? messageFontSize;

  const AwesomeSnackbarContent({
    super.key,
    this.color,
    this.titleFontSize,
    this.messageFontSize,
    required this.title,
    required this.message,
    required this.contentType,
    this.inMaterialBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
      ),
      height: size.height * 0.125,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          /// background container
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: color ?? contentType.color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          /// Splash SVG asset
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                AssetsPath.bubbles,
                height: size.height * 0.06,
                width: size.width * 0.05,
              ),
            ),
          ),

          // Bubble Icon
          Positioned(
            top: -size.height * 0.02,
            left: size.width * 0.02,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AssetsPath.back,
                  height: size.height * 0.06,
                ),
                Positioned(
                  top: size.height * 0.015,
                  child: SvgPicture.asset(
                    //contentType.imageAsset,
                      assetSVG(contentType),
                    height: size.height * 0.022,
                  ),
                )
              ],
            ),
          ),

          /// content
          Positioned.fill(
            left: size.width * 0.15,
            right: size.width * 0.03,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// `title` parameter
                    Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: titleFontSize ?? size.height * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        if (inMaterialBanner) {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                          return;
                        }
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      child: SvgPicture.asset(
                        AssetsPath.failure,
                        height: size.height * 0.022,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),

                /// `message` body text parameter
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: messageFontSize ?? size.height * 0.016,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Reflecting proper icon based on the contentType
  String assetSVG(ContentType contentType) {
    switch (contentType) {
      case ContentType.failure:

        /// failure will show `CROSS`
        return AssetsPath.failure;
      case ContentType.success:

        /// success will show `CHECK`
        return AssetsPath.success;
      case ContentType.warning:

        /// warning will show `EXCLAMATION`
        return AssetsPath.warning;
      case ContentType.help:

        /// help will show `QUESTION MARK`
        return AssetsPath.help;
      default:
        return AssetsPath.failure;
    }
  }
}
