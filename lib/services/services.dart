import 'dart:convert';
import 'dart:io';
import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengerjaan_model.dart';
import 'package:flutter_ruang_nelayan/models/jenis_ikan_model.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'auth_services.dart';
part 'hasil_tangkapan_services.dart';
part 'jenis_ikan_services.dart';
part 'jenis_pengerjaan_ikan_services.dart';
