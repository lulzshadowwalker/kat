import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/typedefs.dart';

/// TODO[FIX] why the fock does the locale need a restart to work
class KatTranslations {
  static const String dark = 'dark';
  static const String light = 'light';
  static const String or = 'or';
  static const String username = 'username';
  static const String password = 'password';
  static const String email = 'email';
  static const String signInWithGoogle = 'signInWithGoogle';
  static const String signUpWithGoogle = 'signUpWithGoogle';
  static const String enterValidEmail = 'enterValidEmail';
  static const String pickStrongPassword = 'pickStrongPassword';
  static const String longerUsername = 'longerUsername';
  static const String alreadyHaveAnAccount = 'alreadyHaveAnAccount';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String dontHaveAnAccount = 'dontHaveAnAccount';
  static const String goBackToHome = 'goBackToHome';
  static const String signedInAnon = 'signedInAnon';
  static const String unknownError = 'unknownError';
  static const String pageDoesNotExist = 'pageDoesNotExist';
  static const String networkRequestFailed = 'network-request-failed';
  static const String cancel = 'cancel';
  static const String camera = 'camera';
  static const String gallery = 'gallery';
  static const String continueAsGuest = 'continueAsGuest';
  static const String signedOut = 'signedOut';
  static const String gif = 'gif';
  static const String saySomething = 'saySomething';
  static const String goodMorning = 'goodMorning';
  static const String howAreYou = 'howAreYou';
  static const String onMyPuter = 'onMyPuter';
  static const String iWouldLikeSomeCoffee = 'iWouldLikeSomeCoffee';
  static const String addToFavs = 'addToFavs';
  static const String share = 'share';
  static const String download = 'download';

  static LangCode? currenetLangCode(BuildContext context) =>
      EasyLocalization.of(context)?.locale.languageCode;
}
