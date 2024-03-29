import 'package:hucel_core/hucel_core.dart';

class AuthencticationConstants {
  static AuthencticationConstants? _instance;
  static AuthencticationConstants get instance {
    _instance ??= AuthencticationConstants._init();
    return _instance!;
  }

  AuthencticationConstants._init();

  String emailLabelText = 'Email Address';
  String emailHintText = 'Please Enter Your Email';
  String passLabelText = 'Password';
  String passHintText = 'Please Enter Your Password';

  /// Login
  String loginTitle = 'Welcome Back!';
  String loginSubTitle = 'Login to your account.';
  String dontHaveAccount = 'Dont have an Account ?';
  String signUp = 'Sign Up';
  String signIn = 'Sign In';
  String forgot = 'Forgot';
  String dividerText = 'Or Sign in With';

  String formFieldIsEmpty = 'Email Or Password field is empty';
  String errorEmailNotValid = 'Your Email is Not Validate';
  String errorEmailLong = 'Your Email is Longer 100 Char';
  String errorPassShort = ' Your Password not long 8 character';
  String errorPassLong = ' Your Password not short 100 character';
  String errorPassNotValid =
      'Not your Password is Validate\n Please One Upper Lower Character, Number, ';
  String loginError = 'Some thing went wrong!..\nIs not Loggin System';

  /// Register
  String registerTitle = 'Welcome';
  String registerSubTitle = 'Create your Account';
  String haveAccount = 'Already have an Account!';
  String errorConfirmPass = 'Not match Confirm and Password';
  String succesSign = 'Sign is Succesfully';
  String registerError = 'Some thing went wrong!..\nIs not Signin System';

  /// Forgot
  String sendEmail = 'Send Email';
  String forgotTitle = 'Please enter your Email';
  String forgotSubTitle = 'and we send a mail for your reset password';

  /// Verifiy
  String resendEmail = 'Resend Email';
  String verifyTitle = 'Verification';
  String verifySubtitle =
      'Please enter your email\nto receive a verification link';

  /// OnBoard
  String previous = 'Previous'.easyLocale;
  String next = 'Next'.easyLocale;
  String skip = 'Skip'.easyLocale;

  String errorEmailVerified = 'Your Email is not Verified';

  /// Validation
  // /// icon
  // String facebookIcon = 'social_facebook';
  // String googleIcon = 'social_google';
  // String twitterIcon = 'social_twitter';
  // String mailIcon = 'mail';
  // String lockIcon = 'lock';
}
