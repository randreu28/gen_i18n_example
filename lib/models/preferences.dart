import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    required ThemeMode themeMode,
    required Locale locale,
  }) = _Preferences;
}
