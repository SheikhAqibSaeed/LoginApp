
class SignUpWithEmailAndPasswordFailure{
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An Unknwon occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'week-password':
        return SignUpWithEmailAndPasswordFailure('Please enter a strong password.');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('Email is not valid.');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('An account already exists for that email.');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('Operation is not allowed. Please contact support');
      case 'user-disable':
        return SignUpWithEmailAndPasswordFailure('This user has been disabled. Please contact support for help.');
        default:
          return SignUpWithEmailAndPasswordFailure();
  }
  }
}