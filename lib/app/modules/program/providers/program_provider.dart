import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/program_model.dart';

class ProgramProvider extends GetConnect {
  final db = FirebaseFirestore.instance;
  late CollectionReference<Map<String, dynamic>> ref;

  @override
  void onInit() {
    ref = db.collection('program');
  }

  Future<Program?> getProgram(String id) async {
    final response = await ref.doc(id).get();
    return Program.fromJson(response.data()!);
  }

  Stream<List<Program>> getPrograms() {
    return ref.snapshots().map((snapshot) => snapshot.docs
        .map(
          (e) => Program.fromFirestore(e),
        )
        .toList());
  }

  Stream<List<Program>> getProgramsByMonth(int month) {
    final now = DateTime.now();
    final start = DateTime(now.year, month);
    final end = DateTime(now.year, month + 1);
    return ref
        .where(
          'start_date',
          isGreaterThanOrEqualTo: start,
        )
        .where(
          'start_date',
          isLessThan: end,
        )
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (e) => Program.fromFirestore(e),
            )
            .toList());
  }

  Future<Response<Program>> postProgram(Program program) async =>
      await post('program', program);

  Future<Response> deleteProgram(int id) async => await delete('program/$id');
}
