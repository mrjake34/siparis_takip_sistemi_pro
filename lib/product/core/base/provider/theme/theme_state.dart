part of 'theme_cubit.dart';

final class ThemeState extends Equatable {
  const ThemeState({this.themeMode});
  final ThemeMode? themeMode;
  @override
  List<Object?> get props => [themeMode];

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

final class ThemeInitial extends ThemeState {}
