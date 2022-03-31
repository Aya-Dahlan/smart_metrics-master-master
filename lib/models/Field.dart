import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Field {
  String siteName;

  double radius;

  String field;

  String cropType;

  Timestamp createdTime = Timestamp.now();

  double lat;

  double long;

  Field();

  Field.fromJson(Map<String, dynamic> json) {
    json['siteName'] = this.siteName;
    json['radius'] = this.radius;
    json['field'] = this.field;
    json['cropType'] = this.cropType;
    json['createdTime'] = this.createdTime;
    json['lat'] = this.lat;
    json['long'] = this.long;
  }

  toMap() {
    return {
      'siteName': this.siteName,
      'radius': this.radius,
      'field': this.field,
      'cropType': this.cropType,
      'createdTime': this.createdTime,
      'lat': this.lat,
      'long': this.long,
    };
  }
}
