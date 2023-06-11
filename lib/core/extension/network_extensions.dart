import '../constants/enums/network_enums.dart';

extension NetworkTypeExtension on HttpTypes? {
  String get rawValue {
    switch (this) {
      case HttpTypes.get:
        return 'GET';
      case HttpTypes.post:
        return 'POST';
      case HttpTypes.delete:
        return 'DELETE';
      default:
        throw 'Error';
    }
  }
}
