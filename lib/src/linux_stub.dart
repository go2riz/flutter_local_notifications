import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';

/// Lightweight Linux compatibility layer for projects that intentionally
/// removed the native Linux implementation from this fork.
///
/// These types preserve the public Dart API surface so existing imports and
/// example code continue to compile, while Linux operations become safe no-ops.
class LinuxFlutterLocalNotificationsPlugin
    extends FlutterLocalNotificationsPlatform {
  Future<bool?> initialize(
    LinuxInitializationSettings initializationSettings, {
    SelectNotificationCallback? onSelectNotification,
  }) async => false;

  Future<void> show(
    int id,
    String? title,
    String? body, {
    LinuxNotificationDetails? notificationDetails,
    String? payload,
  }) async {}

  Future<LinuxServerCapabilities> getCapabilities() async =>
      const LinuxServerCapabilities.unsupported();

  @override
  Future<void> cancel(int id) async {}

  @override
  Future<void> cancelAll() async {}

  @override
  Future<NotificationAppLaunchDetails?> getNotificationAppLaunchDetails() async =>
      const NotificationAppLaunchDetails(false, null);

  @override
  Future<List<PendingNotificationRequest>> pendingNotificationRequests() async =>
      <PendingNotificationRequest>[];

  @override
  Future<void> periodicallyShow(
    int id,
    String? title,
    String? body,
    RepeatInterval repeatInterval,
  ) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class InitializationSettingsLinuxDeprecatedMessage {
  static const String message =
      'Linux support was intentionally removed from this custom fork. '
      'These compatibility classes remain only so existing Dart code compiles.';
}

class LinuxInitializationSettings {
  const LinuxInitializationSettings({
    this.defaultActionName,
    this.defaultIcon,
  });

  final String? defaultActionName;
  final LinuxIcon? defaultIcon;
}

class LinuxNotificationDetails {
  const LinuxNotificationDetails({
    this.category,
    this.icon,
    this.sound,
    this.urgency,
    this.timeout,
    this.suppressSound,
    this.transient,
    this.resident,
    this.location,
  });

  final LinuxNotificationCategory? category;
  final LinuxIcon? icon;
  final LinuxSound? sound;
  final LinuxNotificationUrgency? urgency;
  final LinuxNotificationTimeout? timeout;
  final bool? suppressSound;
  final bool? transient;
  final bool? resident;
  final LinuxNotificationLocation? location;
}

abstract class LinuxIcon {
  const LinuxIcon();
}

class AssetsLinuxIcon extends LinuxIcon {
  const AssetsLinuxIcon(this.assetName);
  final String assetName;
}

class ByteDataLinuxIcon extends LinuxIcon {
  const ByteDataLinuxIcon(this.iconData);
  final LinuxRawIconData iconData;
}

class FilePathLinuxIcon extends LinuxIcon {
  const FilePathLinuxIcon(this.path);
  final String path;
}

class ThemeLinuxIcon extends LinuxIcon {
  const ThemeLinuxIcon(this.name);
  final String name;
}

class LinuxRawIconData {
  const LinuxRawIconData({
    required this.data,
    required this.width,
    required this.height,
    required this.channels,
    required this.hasAlpha,
  });

  final Uint8List data;
  final int width;
  final int height;
  final int channels;
  final bool hasAlpha;
}

abstract class LinuxSound {
  const LinuxSound();
}

class AssetsLinuxSound extends LinuxSound {
  const AssetsLinuxSound(this.assetName);
  final String assetName;
}

class ThemeLinuxSound extends LinuxSound {
  const ThemeLinuxSound(this.name);
  final String name;
}

enum LinuxNotificationUrgency { low, normal, critical }

class LinuxNotificationTimeout {
  LinuxNotificationTimeout.fromDuration(this.duration);
  final Duration duration;
}

class LinuxNotificationLocation {
  const LinuxNotificationLocation(this.x, this.y);
  final int x;
  final int y;
}

class LinuxNotificationCategory {
  const LinuxNotificationCategory._(this.value);

  final String value;

  static LinuxNotificationCategory emailArrived() =>
      const LinuxNotificationCategory._('email.arrived');
}

class LinuxServerCapabilities {
  const LinuxServerCapabilities({
    this.body,
    this.bodyHyperlinks,
    this.bodyImages,
    this.bodyMarkup,
    this.iconMulti,
    this.iconStatic,
    this.persistence,
    this.sound,
    this.otherCapabilities,
  });

  const LinuxServerCapabilities.unsupported()
      : body = 'unsupported',
        bodyHyperlinks = 'unsupported',
        bodyImages = 'unsupported',
        bodyMarkup = 'unsupported',
        iconMulti = 'unsupported',
        iconStatic = 'unsupported',
        persistence = 'unsupported',
        sound = 'unsupported',
        otherCapabilities = InitializationSettingsLinuxDeprecatedMessage.message;

  final Object? body;
  final Object? bodyHyperlinks;
  final Object? bodyImages;
  final Object? bodyMarkup;
  final Object? iconMulti;
  final Object? iconStatic;
  final Object? persistence;
  final Object? sound;
  final Object? otherCapabilities;
}
