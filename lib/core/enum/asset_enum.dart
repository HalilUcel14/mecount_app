import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AssetIcon {
  arrowRight,
  back,
  bell,
  bill,
  call,
  camera,
  cart,
  cash,
  chatBubble,
  checkMarkRounde,
  close,
  conversation,
  discover,
  error,
  exclamation,
  flash,
  game,
  gift,
  heart,
  heartTwo,
  locationPoint,
  lock,
  logOut,
  mail,
  parcel,
  phone,
  plus,
  questionMark,
  receipt,
  remove,
  search,
  settings,
  shop,
  socialFacebook,
  socialGoogle,
  socialTwitter,
  star,
  success,
  themeDark,
  themeLight,
  translate,
  trash,
  user,
  userTwo

  // Function Başlatma Yeri
  ;

  String get pathSvg => 'assets/icons/$this.svg';
  String get pathPng => 'assets/icons/$this.png';

  Widget get svgImage => SvgPicture.asset(pathSvg);
  Widget get pngImage => Image.asset(pathPng);
}

enum AssetLottie {
  businessGraphic,
  chart,
  chart2,
  contact,
  cycleBike,
  dayNight,
  errorPage,
  forgotPass,
}
