class LoginConstant {
  static LoginConstant? _instance;
  static LoginConstant get instance {
    _instance ??= LoginConstant._init();
    return _instance!;
  }

  LoginConstant._init();

  String welcome = 'Welcome Back!';
  String loginText = 'Login to your account.';
  String mailIcon = 'mail';
  String passIcon = 'lock';
  String dontHaveAccount = 'Dont have an Account?';
  String signUp = 'Sign Up';
  String facebookIcon = 'social_facebook';
  String googleIcon = 'social_google';
  String twitterIcon = 'social_twitter';
  String orSignWith = 'Or Sign in With';
  String signInButton = 'Sign In';
}
