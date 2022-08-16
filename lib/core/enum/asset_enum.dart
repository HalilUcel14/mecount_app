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

  String get string => toString().split('.').last;
}

enum AssetLottieEnum {
  businessGraphic,
  chart,
  chart2,
  contact,
  cycleBike,
  dayNight,
  errorPage,
  forgotPass,

  // Function Başlatma Yeri
  ;

  String get string => toString().split('.').last;

  String get path => 'assets/lottie/$string.json';
}
