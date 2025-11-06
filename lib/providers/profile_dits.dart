import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProflieDitsNotifier extends StateNotifier<Map<String, String>> {
  ProflieDitsNotifier() : super({});

  void profileDits(String key, String val) {
    state = {...state, key: val};
  }
}

final profileDitsProvider =
    StateNotifierProvider<ProflieDitsNotifier, Map<String, String>>((ref) {
      return ProflieDitsNotifier();
    });
