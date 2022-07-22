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
}
