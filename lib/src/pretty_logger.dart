import 'dart:async';
import '../pretty_logger.dart';

class PrettyLoger {
  static String successColor = PrettyColor.greenColor;
  static String errorColor = PrettyColor.redColor;
  static String warningColor = PrettyColor.yellowColor;
  static String infoColor = PrettyColor.blueColor;
  static String debugColor = PrettyColor.cyanColor;
  static String? nameColor;
  static String? messageColor;
  static String? levelColor;
  static String? timeColor;
  static String? sequenceNumberColor;

  static void setDefaultColor({
    String? successColor,
    String? errorColor,
    String? warningColor,
    String? infoColor,
    String? debugColor,
    String? nameColor,
    String? messageColor,
    String? levelColor,
    String? timeColor,
    String? sequenceNumberColor,
  }) {
    if (successColor != null) PrettyLoger.successColor = successColor;
    if (errorColor != null) PrettyLoger.errorColor = errorColor;
    if (warningColor != null) PrettyLoger.warningColor = warningColor;
    if (infoColor != null) PrettyLoger.infoColor = infoColor;
    if (debugColor != null) PrettyLoger.debugColor = debugColor;
    if (nameColor != null) PrettyLoger.nameColor = nameColor;
    if (messageColor != null) PrettyLoger.messageColor = messageColor;
    if (levelColor != null) PrettyLoger.levelColor = levelColor;
    if (timeColor != null) PrettyLoger.timeColor = timeColor;
    if (sequenceNumberColor != null) PrettyLoger.sequenceNumberColor = sequenceNumberColor;
  }
}

void log(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  int level = 0,
  String name = '',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
  String? nameColor,
  String? messageColor,
  String? levelColor,
  String? timeColor,
  String? sequenceNumberColor,
}) {
  // set from Default
  nameColor ??= PrettyLoger.nameColor;
  messageColor ??= PrettyLoger.messageColor;
  levelColor ??= PrettyLoger.levelColor;
  timeColor ??= PrettyLoger.timeColor;
  sequenceNumberColor ??= PrettyLoger.sequenceNumberColor;

  final StringBuffer output = StringBuffer();

  if (time != null) {
    if (timeColor != null) {
      output.write('$timeColor${time.toIso8601String()}${PrettyColor.resetColor} ');
    } else {
      output.write('${time.toIso8601String()} ');
    }
  }

  if (sequenceNumber != null) {
    if (sequenceNumberColor != null) {
      output.write('$sequenceNumberColor[$sequenceNumber]${PrettyColor.resetColor} ');
    } else {
      output.write('[$sequenceNumber] ');
    }
  }

  if (name.isNotEmpty) {
    if (nameColor != null) {
      output.write('$nameColor$name${PrettyColor.resetColor} ');
    } else {
      output.write('$name ');
    }
  }

  if (level > 0) {
    if (levelColor != null) {
      output.write('$levelColor${'  ' * level}${PrettyColor.resetColor} ');
    } else {
      output.write('  ' * level);
    }
  }
  output.write(PrettyColor.resetColor);
  output.write(messageColor ?? PrettyColor.resetColor);
  output.write(message);
  output.write(PrettyColor.resetColor);

  if (error != null) {
    output.write('\n$error');
  }

  if (stackTrace != null) {
    output.write('\n$stackTrace');
  }

  print(output.toString());
}

void successLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  String name = '[SUCCESS]',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
  String? nameColor,
  String? messageColor,
  String? levelColor,
  String? timeColor,
  String? sequenceNumberColor,
  String? backgroundColor,
}) {
  messageColor ??= PrettyLoger.successColor;
  nameColor ??= PrettyColor.greenColor;
  log(
    message,
    time: time,
    sequenceNumber: sequenceNumber,
    level: 0,
    name: name,
    zone: zone,
    error: error,
    stackTrace: stackTrace,
    messageColor: messageColor,
    nameColor: nameColor,
    timeColor: timeColor,
    sequenceNumberColor: sequenceNumberColor,
    levelColor: levelColor,
  );
}

void errorLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  String name = '[ERROR]',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
  String? nameColor,
  String? messageColor,
  String? levelColor,
  String? timeColor,
  String? sequenceNumberColor,
  String? backgroundColor,
}) {
  messageColor ??= PrettyLoger.errorColor;
  nameColor ??= PrettyColor.redColor;
  log(
    message,
    time: time,
    sequenceNumber: sequenceNumber,
    level: 0,
    name: name,
    zone: zone,
    error: error,
    stackTrace: stackTrace,
    messageColor: messageColor,
    nameColor: nameColor,
    timeColor: timeColor,
    sequenceNumberColor: sequenceNumberColor,
    levelColor: levelColor,
  );
}

void warningLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  String name = '[WARNING]',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
  String? nameColor,
  String? messageColor,
  String? levelColor,
  String? timeColor,
  String? sequenceNumberColor,
  String? backgroundColor,
}) {
  messageColor ??= PrettyLoger.warningColor;
  nameColor ??= PrettyColor.yellowColor;
  log(
    message,
    time: time,
    sequenceNumber: sequenceNumber,
    level: 0,
    name: name,
    zone: zone,
    error: error,
    stackTrace: stackTrace,
    messageColor: messageColor,
    nameColor: nameColor,
    timeColor: timeColor,
    sequenceNumberColor: sequenceNumberColor,
    levelColor: levelColor,
  );
}

void infoLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  String name = '[INFO]',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
  String? nameColor,
  String? messageColor,
  String? levelColor,
  String? timeColor,
  String? sequenceNumberColor,
  String? backgroundColor,
}) {
  messageColor ??= PrettyLoger.infoColor;
  nameColor ??= PrettyColor.blueColor;
  log(
    message,
    time: time,
    sequenceNumber: sequenceNumber,
    level: 0,
    name: name,
    zone: zone,
    error: error,
    stackTrace: stackTrace,
    messageColor: messageColor,
    nameColor: nameColor,
    timeColor: timeColor,
    sequenceNumberColor: sequenceNumberColor,
    levelColor: levelColor,
  );
}

void debugLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  String name = '[DEBUG]',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
  String? nameColor,
  String? messageColor,
  String? levelColor,
  String? timeColor,
  String? sequenceNumberColor,
  String? backgroundColor,
}) {
  messageColor ??= PrettyLoger.debugColor;
  nameColor ??= PrettyColor.cyanColor;
  log(
    message,
    time: time,
    sequenceNumber: sequenceNumber,
    level: 0,
    name: name,
    zone: zone,
    error: error,
    stackTrace: stackTrace,
    messageColor: messageColor,
    nameColor: nameColor,
    timeColor: timeColor,
    sequenceNumberColor: sequenceNumberColor,
    levelColor: levelColor,
  );
}
