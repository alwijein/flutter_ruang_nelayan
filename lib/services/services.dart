import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/cart_model.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/models/tipe_ikan_model.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengantaran_model.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengerjaan_model.dart';
import 'package:flutter_ruang_nelayan/models/jenis_ikan_model.dart';
import 'package:flutter_ruang_nelayan/models/laporan_harian_model.dart';
import 'package:flutter_ruang_nelayan/models/message_model.dart';
import 'package:flutter_ruang_nelayan/models/transaction_model.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

// ...

part 'auth_services.dart';
part 'hasil_tangkapan_services.dart';
part 'jenis_ikan_services.dart';
part 'jenis_pengerjaan_ikan_services.dart';
part 'tip_ikan_services.dart';
part 'transaction_services.dart';
part 'jasa_pengantaran_services.dart';
part 'laporan_harian_services.dart';
part 'message_service.dart';
