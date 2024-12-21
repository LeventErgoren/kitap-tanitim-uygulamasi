import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgres/postgres.dart';

final getConnector = FutureProvider<Connection>((ref) async {
  print("DATABASE");
  final conn = await Connection.open(
    Endpoint(
      host: '172.31.112.1',
      database: 'Kitap_Proje',
      username: 'postgres',
      password: '196262',
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );

  return conn;
});

final getDatabaseUserNames =
    FutureProvider.family<bool, String>((ref, String userName) async {
  try {
    Connection conn = await ref.watch(getConnector.future);
    final result = await conn
        .execute("SELECT * FROM kullanici where kullanici_adi = '$userName'");

    if (result.length > 0) {
      return false;
    } else {
      return true;
    }
  } catch (e) {
    print(e);
  }

  return false;
});
