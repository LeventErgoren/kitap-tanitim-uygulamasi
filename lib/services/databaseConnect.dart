import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgres/postgres.dart';

final getConnector = FutureProvider<Connection>((ref) async {
  print("DATABASE");
  final conn = await Connection.open(
    Endpoint(
      host: '185.169.180.103',
      database: 'kitap_tanitim',
      username: 'postgres',
      password: '196262',
      port: 7218,
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
