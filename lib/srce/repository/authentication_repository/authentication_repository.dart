import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/srce/comman_widget/fade_in_animation/animation_design.dart';
import '../../features/authentications/core/screens/dashboard/dashboard.dart';
import '../../features/authentications/screens/welcome/welcome_screen.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  var phoneVerificationId = ''.obs;
  late final GoogleSignInAccount _googleUser;

  // Getters
  User? get firebaseUser => _firebaseUser.value;

  String get getUserID => firebaseUser.uid ?? "";

  String get getUserEmail => firebaseUser.email ?? "";

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    ever(_firebaseUser, _setInitialScreen);
  }

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  }

  // Email & Password sign in
  /// [EmailAuthentication] - Login
  Future<void> loginWithEmailAndPassword(String email, String password) async {

  }
  /// [EmailAuthentication] - Registration
  Future<void> createUserWithEmailAndPassword(String email, String password) async {

  }
  /// [EmailAuthentication] - Verification
  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    }
    on FirebaseAuthException catch (e) {
      final ex = TException.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TException();
      throw ex.message;
    }
  }

  // Federated identity and social sign-in
  /// [GoogleAuthentication] - Google
  Future<UserCredential> signInWithGoogle() async {

  }
  /// [FacebookAuthentication] - Facebook
  Future<UserCredential> signInWithFacebook() async {

  }
  /// [PhoneAuthentication] - Phone
  signInWithPhoneNo(String phoneNumber) async {

  }
  /// [PhoneAuthentication] - Register
  Future<void> phoneAuthentication(String phoneNo) async {

  }
  /// [PhoneAuthentication] - Verify Phone No by Otp
  Future<bool> verifyOtp(String otp) async {

  }
  // Phone Authentication
  loginWithPhoneNo(String phoneNumber) async {
    try{
      await _auth.signInWithPhoneNumber(phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number'){
        Get.snackbar("Error", "Invalid Phone No");
      }
    } catch(_) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
  //FUNC
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      codeSent: (verificationId, resendToken){
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid');
        } else {
          Get.snackbar('Error', 'Something went worng, Try again');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
