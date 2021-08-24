abstract class AuthFailure implements Exception {}

class InvalidEmail implements AuthFailure {}

class InvalidPassword implements AuthFailure {}

class InvalidName implements AuthFailure {}
