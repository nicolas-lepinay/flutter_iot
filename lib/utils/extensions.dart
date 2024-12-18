import 'package:arduino_iot_app/models/schema/equipment.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

extension EquipmentExtension on Equipment {
  EquipmentAsset get equipmentAsset {
    switch (esp32Id) {
      case 'LED':
        switch (state) {
          case true:
            return EquipmentAsset.ledOn;
          case false:
            return EquipmentAsset.ledOff;
        }
      case 'RGB_LED':
        return EquipmentAsset.rgbLed;
      case 'FAN':
        return EquipmentAsset.fan;
      case 'LCD_DISPLAY':
        return EquipmentAsset.lcdDisplay;
      case 'TEMP_SENSOR':
        return EquipmentAsset.temperatureSensor;
      case 'HUMIDITY_SENSOR':
        return EquipmentAsset.humiditySensor;
      case 'GAS_SENSOR':
        return EquipmentAsset.gasSensor;
      case 'STEAM_SENSOR':
        return EquipmentAsset.smokeSensor;
      case 'MOTION_SENSOR':
        return EquipmentAsset.motionSensor;
      case 'WINDOW_SERVO':
        return EquipmentAsset.windowServo;
      case 'DOOR_SERVO':
        switch (state) {
          case true:
            return EquipmentAsset.doorServoOn;
          case false:
            return EquipmentAsset.doorServoOff;
        }
      case 'BUZZER':
        switch (state) {
          case true:
            return EquipmentAsset.buzzerOn;
          case false:
            return EquipmentAsset.buzzerOff;
        }
      default:
        return EquipmentAsset.unknown;
    }
  }

  IconData get dataIcon {
    switch (esp32Id) {
      case 'LED':
      case 'RGB_LED':
        return Icons.lightbulb;
      case 'FAN':
        return Icons.wind_power;
      case 'LCD_DISPLAY':
        return Icons.tv;
      case 'TEMP_SENSOR':
        return Icons.thermostat;
      case 'HUMIDITY_SENSOR':
        return Icons.water_drop;
      case 'GAS_SENSOR':
        return Icons.gas_meter;
      case 'STEAM_SENSOR':
        return Icons.fireplace;
      case 'WINDOW_SERVO':
        return Icons.window_rounded;
      case 'DOOR_SERVO':
        return Icons.door_back_door_rounded;
      case 'MOTION_SENSOR':
        return Icons.visibility;
      case 'BUZZER':
        switch (state) {
          case true:
            return Icons.volume_up_rounded;
          case false:
            return Icons.volume_off_rounded;
        }
      default:
        return Icons.sensors;
    }
  }

  String? get formatedValue {
    switch (esp32Id) {
      case 'GAS_SENSOR':
        switch (state) {
          case true:
            return 'Gaz détecté';
          case false:
            return 'Pas de gaz';
        }
      case 'STEAM_SENSOR':
        switch (state) {
          case true:
            return 'Fumée détectée';
          case false:
            return 'Pas de fumée';
        }
      case 'MOTION_SENSOR':
        switch (state) {
          case true:
            return 'Mouvement détecté';
          case false:
            return 'Pas de mouvement';
        }
      case 'LED':
        switch (state) {
          case true:
            return 'Allumée';
          case false:
            return 'Éteinte';
        }
      default:
        return value;
    }
  }

  bool get isActionable {
    switch (esp32Id) {
      case 'LED':
      case 'RGB_LED':
      case 'FAN':
      case 'LCD_DISPLAY':
      case 'BUZZER':
      case 'WINDOW_SERVO':
      case 'DOOR_SERVO':
        return true;
      default:
        return false;
    }
  }

  List<double>? get defaultRangeValues {
    switch (esp32Id) {
      case 'FAN':
        return [0, 255];
      case 'BUZZER':
        return [0, 12000];
      case 'WINDOW_SERVO':
      case 'DOOR_SERVO':
        return [0, 180];
      default:
        return null;
    }
  }

  dynamic get defaultOffValue {
    switch (esp32Id) {
      case 'LED':
        return 'LOW';
      case 'RGB_LED':
        return '0, 0, 0';
      case 'LCD_DISPLAY':
        return "";
      case 'WINDOW_SERVO':
      case 'DOOR_SERVO':
      case 'FAN':
      case 'BUZZER':
        return 0;
      default:
        return null;
    }
  }

  Color get colorOn {
    switch (isActionable) {
      case true:
        return Constants.pickle;
      case false:
        switch (esp32Id) {
          case 'TEMP_SENSOR':
          case 'HUMIDITY_SENSOR':
            return Constants.babyBlue;
          case 'GAS_SENSOR':
          case 'STEAM_SENSOR':
          case 'MOTION_SENSOR':
            return Constants.tomato;
          default:
            return Constants.pickle;
        }
    }
  }

  Color get colorOff {
    switch (isActionable) {
      case true:
        return Constants.tomato;
      case false:
        switch (esp32Id) {
          case 'GAS_SENSOR':
          case 'STEAM_SENSOR':
          case 'MOTION_SENSOR':
            return Constants.neutral;
          default:
            return Constants.tomato;
        }
    }
  }

  String get imageAssetPath {
    return equipmentAsset.assetPath;
  }
}

enum EquipmentAsset {
  ledOn('assets/images/bulb-3d-on.webp'),
  ledOff('assets/images/bulb-3d-off.webp'),
  rgbLed('assets/images/rgb-led-3d.png'),
  fan('assets/images/fan-3d.webp'),
  lcdDisplay('assets/images/tv-3d.png'),
  temperatureSensor('assets/images/snowflake-3d.png'),
  humiditySensor('assets/images/humidity-3d.webp'),
  gasSensor('assets/images/gas-3d.png'),
  smokeSensor('assets/images/smoke-3d.png'),
  doorServoOn('assets/images/door-3d-open.webp'),
  doorServoOff('assets/images/door-3d.webp'),
  windowServo('assets/images/window-3d-v2.png'),
  motionSensor('assets/images/motion-3d.png'),
  buzzerOn('assets/images/speaker-on-3d.png'),
  buzzerOff('assets/images/speaker-off-3d.png'),
  unknown('assets/images/unknown-3d.png');

  final String assetPath;
  const EquipmentAsset(this.assetPath);
}
