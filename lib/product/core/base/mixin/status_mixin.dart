import '../../constants/enums/network_status.dart';

mixin class StatusMixin {
  NetworkStatus getStatus(String value) => switch (value) {
        'Register process completed successfully' =>
          NetworkStatus.registerSuccess,
        'Create process completed successfully' => NetworkStatus.createdSuccess,
        'Update process completed successfully' => NetworkStatus.updateSuccess,
        'Delete process completed successfully' => NetworkStatus.deleteSuccess,
        'Detail process completed successfully' => NetworkStatus.detailsSuccess,
        'Login process completed successfully' => NetworkStatus.loginSuccess,
        'Item listed successfuly' => NetworkStatus.listSuccess,
        'Register process completed with an error' =>
          NetworkStatus.registerFailed,
        'Create process completed with an error' => NetworkStatus.createFailed,
        'Update process completed with an error' => NetworkStatus.updateFailed,
        'Delete process completed with an error' => NetworkStatus.deleteFailed,
        'Detail process completed with an error' => NetworkStatus.detailsFailed,
        'Login process completed with an error' => NetworkStatus.loginFailed,
        'Inputs must be filled' => NetworkStatus.inputsNotFilled,
        'Inputs must be filled or check input types' =>
          NetworkStatus.inputsNotFilledOrTypesWrong,
        'User not found' => NetworkStatus.userNotFound,
        'Wrong UserId' => NetworkStatus.userIdFailed,
        'Courier not found' => NetworkStatus.courierNotFound,
        'Email is already in use' => NetworkStatus.emailFailed,
        'ShopName is already in use' => NetworkStatus.shopNameFailed,
        'Phone is already in use' => NetworkStatus.phoneFailed,
        'Product name already in use' => NetworkStatus.productNameFailed,
        'Product not found' => NetworkStatus.productNotFound,
        'Order not found' => NetworkStatus.orderNotFound,
        'Customer not found' => NetworkStatus.customerNotFound,
        'Phone or Email is already in use' => NetworkStatus.phoneOrEmailFailed,
        'Unauthorized' => NetworkStatus.unauthorized,
        'Unknown error' => NetworkStatus.unknownError,
        _ => NetworkStatus.unknownError,
      };

  NetworkStatus getStatusFromCode(int code) => switch (code) {
        200 => NetworkStatus.success,
        201 => NetworkStatus.createdSuccess,
        204 => NetworkStatus.deleteSuccess,
        400 => NetworkStatus.inputsNotFilled,
        401 => NetworkStatus.unauthorized,
        403 => NetworkStatus.unauthorized,
        404 => NetworkStatus.failedLoadData,
        409 => NetworkStatus.failedLoadData,
        500 => NetworkStatus.failedLoadData,
        _ => NetworkStatus.unknownError,
      };
}
