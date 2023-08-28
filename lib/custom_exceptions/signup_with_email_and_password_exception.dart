

class SignupWithEmailAndPasswordFailure{
  final String message;

  const SignupWithEmailAndPasswordFailure([this.message="An Uknown Error Occurred"]);

  factory SignupWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignupWithEmailAndPasswordFailure('Please Enter a stronger password');
      case 'invalid-email':
        return const SignupWithEmailAndPasswordFailure('Email not valid or badly formatted');
      case 'email-already-in-use':
        return const SignupWithEmailAndPasswordFailure('An account already exists for that email');
      case 'user-disabled':
        return const SignupWithEmailAndPasswordFailure('This user has been disabled please contact Support for help');
      default:
        return const SignupWithEmailAndPasswordFailure();
    }
  }

}