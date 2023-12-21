enum PreferenceKey {
  userModel,
  cookie,
  role,
  id,
  shopName,
  userId,
  userName,
  userEmail,
  userPhone,
  paymentStatus,
  userUpdatedAt,
  firstLogin,
  theme,
}

enum Status { isValidate, isLoading, isDone, isFailed }

enum UserStatus { userNotFound, userDeleted, userAlreadySignIn }

enum Validate { validateTrue, validateFalse }

enum LocationService {
  serviceOff,
  serviceOn,
  always,
  denied,
  deniedForever,
  whileInUse
}

enum UserRole { user, courier, admin }

enum AutoLogin {
  isLoading,
  completed,
  failed,
}

enum PopupMenuItemEnum { remove, edit }

enum ProductEnum {
  name,
  price,
  quantity,
  description,
}

enum ProfileEnum {
  name,
  email,
  phone,
  password,
  confirmPassword,
}
