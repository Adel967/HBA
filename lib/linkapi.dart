class AppLink {
  static const String server = "http://192.168.1.106/hotel_managment_system";

  static const String test = "$server/test.php";

//---assets---//
  static const String imagestHotels = "$server/images/hotels";
  static const String imagestRooms = "$server/images/rooms";
  //---Auth---//
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String resendCode = "$server/auth/resendcode.php";

  //---Forget Password---//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodeForgetPassword = "$server/forgetpassword/verifycode.php";
  static const String resetpassword = "$server/forgetpassword/resetpassword.php";
  
  //---home---//
  static const String homepage = "$server/home.php";
}
