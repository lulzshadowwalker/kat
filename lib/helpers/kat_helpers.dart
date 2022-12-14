import 'dart:io' show Platform;
import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'kat_const.dart';
import '../controllers/notif_controller.dart';
import '../models/enums/notif_type.dart';
import 'package:logger/logger.dart';

import '../translations/kat_translations.dart';
import '../views/shared/kat_image_picker/kat_image_picker.dart';
import 'kat_log_printer.dart';

class KatHelpers {
  /* STRING CONSTANTS --------------------------------------------------------- */
  /// class name===
  static const String _cn = 'KatHelpers';
  /* -------------------------------------------------------------------------- */
  static final _log = getLogger(_cn);

  /// Instantiate a [Logger] instance with the neseccary boilerplate code
  static Logger getLogger(String className) => Logger(
        printer: KatLogPrinter(className),
      );

  static void handleSocketException(
    BuildContext context,
    Logger logger,
  ) {
    logger.e('SocketExcepetion, check internet connection.');

    NotifController.showPopup(
      context: context,
      desc: KatTranslations.networkRequestFailed.tr(),
      type: NotifType.oops,
    );
  }

  static void handleUnkownError(
    BuildContext context,
    Object error,
    Logger logger,
  ) {
    logger.e(error.toString());

    NotifController.showPopup(
      context: context,
      desc: KatTranslations.unknownError.tr(),
      type: NotifType.oops,
    );
  }

  ///returns [true] if the application is currently running on a mobile platform
  static bool get isAndroidOrIos =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  /// image picking utility for android/iOS/web
  /// ..
  /// mobile, gallery / camera
  /// web, gallery
  static Future<Uint8List?> pickImage(BuildContext context) async {
    try {
      final aborted =
          Exception('Image picking proccess terminated by the user');

      ImageSource? imageSource = ImageSource.gallery;

      if (!kIsWeb && KatHelpers.isAndroidOrIos) {
        imageSource = await showModalBottomSheet(
          context: context,
          builder: (_) => const KatImagePicker(),
          backgroundColor: Colors.transparent,
          constraints: const BoxConstraints(maxWidth: 500),
        );

        if (imageSource == null) {
          throw aborted;
        }
      }

      final image = await ImagePicker().pickImage(source: imageSource);

      if (image == null) {
        throw aborted;
      }

      return image.readAsBytes();
    } catch (e) {
      _log.e(e.toString());
      return null;
    }
  }

  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;

  // returns a random int between min (default 0) and max
  static int randomInt({
    required int max,
    int min = 0,
  }) =>
      math.Random().nextInt(max) + min;

  /// returns the subjective screen width depending on the orientation of the device
  static int screenWidth(BuildContext context) => isPortrait(context)
      ? math.min(
          screenSize(context).width.toInt(),
          screenSize(context).height.toInt(),
        )
      : math.max(
          screenSize(context).width.toInt(),
          screenSize(context).height.toInt(),
        );

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  /// returns [true] if the screen width is less than or equal to the mobile breakpoint
  static bool isMobileBp(BuildContext context) =>
      screenWidth(context) <= KatConst.mobileBreakpoint;

  /// returns [true] if the screen width is less than or equal to the tablet breakpoint
  static bool isTabletBp(BuildContext context) =>
      screenWidth(context) <= KatConst.tabletBreakpoint && !isMobileBp(context);

  /// returns [true] if the screen width larger than the tablet breakpoint
  static bool isDesktopBp(BuildContext context) =>
      screenWidth(context) > KatConst.tabletBreakpoint;
}
