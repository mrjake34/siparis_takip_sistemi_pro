import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/singletons/cache/shared_manager.dart';
import '../../../../core/singletons/translation/locale_keys.g.dart';
import '../../../../core/singletons/utils/utils.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(const SplashScreenState());

  Future<void> init() async {
    emit(state.copyWith(status: Status.isLoading));

    final userRole = SharedManager.instance.getStringValue(PreferenceKey.role);

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      emit(
        state.copyWith(
          status: Status.isLoading,
          role: userRole,
          locationService: LocationService.serviceOff,
        ),
      );
    } else {
      final posistion = await Geolocator.getCurrentPosition();
      emit(
        state.copyWith(
          status: Status.isDone,
          role: userRole,
          locationService: LocationService.always,
          position: posistion,
        ),
      );
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(
          state.copyWith(
            status: Status.isDone,
            locationService: LocationService.denied,
          ),
        );
      }
    } else if (permission == LocationPermission.deniedForever) {
      UtilsService.instance.errorSnackBar(LocaleKeys.errors_locationPermissionOff.tr());
      emit(
        state.copyWith(
          status: Status.isDone,
          locationService: LocationService.deniedForever,
        ),
      );
    } else {
      final posistion = await Geolocator.getCurrentPosition();
      emit(
        state.copyWith(
          status: Status.isDone,
          locationService: LocationService.always,
          position: posistion,
        ),
      );
    }
  }
}
