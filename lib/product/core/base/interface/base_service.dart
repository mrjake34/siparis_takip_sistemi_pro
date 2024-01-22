abstract class BaseService {
  Map<String, dynamic> setHeaderWithCookie(String cookie) => {
        'authorization': 'Bearer $cookie',
      };
}
