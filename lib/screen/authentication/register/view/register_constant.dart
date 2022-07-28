class RegisterConstant {
  static RegisterConstant? _instance;
  static RegisterConstant get instance {
    _instance ??= RegisterConstant._init();
    return _instance!;
  }

  RegisterConstant._init();

  String registerTitle = 'Welcome';
  String registerSubTitle = 'Create your Account';
  String mailIcon = 'mail';
  String passIcon = 'lock';
  String haveAccount = 'Already have an Account!';
  String logInTextButton = 'Sign In';
  String registerButton = 'Sign Up';

  String emailLabel = 'Email Address';
  String emailHint = 'Please Enter Your Email';
  String passLabel = 'Password';
  String passHint = 'Please Enter Your Password';

  String errorEmptyField = 'Please Enter Email and Password';
  String errorEmailNotValid = 'Not your Email is Validate';
  String errorPassShort = ' Your Password not long 8 character';
  String errorPassNotValid =
      'Not your Password is Validate\n Please One Upper Lower Character, Number, ';
  String errorMatchPass = 'İs Not Match Confirm and Password';
}
