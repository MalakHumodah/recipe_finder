import 'dart:ui';

import '../../constants/assets_path.dart';

class DefaultColors {
  /// help
  static const Color helpBlue = Color(0xff3282B8);

  /// failure
  static const Color failureRed = Color(0xffc72c41);

  /// success
  static const Color successGreen = Color(0xff2D6A4F);

  /// warning
  static const Color warningYellow = Color(0xffFCA652);
}

class ContentType {
  final String message;
  final Color? color;
  final String imageAsset;

  const ContentType(this.message, this.imageAsset, [this.color]);

  static const ContentType help = ContentType(
    AssetsPath.help,
    'help',
    DefaultColors.helpBlue,
  );
  static const ContentType failure = ContentType(
    AssetsPath.failure,
    'failure',
    DefaultColors.failureRed,
  );
  static const ContentType success = ContentType(
    AssetsPath.success,
    'success',
    DefaultColors.successGreen,
  );
  static const ContentType warning = ContentType(
    AssetsPath.warning,
    'warning',
    DefaultColors.warningYellow,
  );
}
