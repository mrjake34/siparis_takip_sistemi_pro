
enum HttpTypes { post, get, delete, put }

enum HttpPaths { login, signup, refresh, user }

enum PatchProductEnums { name, price }

enum RegisterErrors {
  emailAlreadyExists('Email is already in use'),
  phoneAlreadyExists('Phone is already in use'),
  shopNameAlreadyExists('Shopname already exists'),
  passwordNotMatch('Password not match'),
  unknownError('Unknown error');

  const RegisterErrors(this.error);
  final String? error;

}
