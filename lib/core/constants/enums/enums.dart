enum PreferenceKey {
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
  firstLogin
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


enum AutoLogin {isLoading, completed, failed,}