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

  Future<Program?> getProgram(int id) async {
    final response = await get('program/$id');
    return response.body;
  }

  Stream<List<Program>> getPrograms() {
    return ref.snapshots().map((snapshot) => snapshot.docs
        .map(
          (e) => Program.fromFirestore(e),
        )
        .toList());
  }

  Future<Response<Program>> postProgram(Program program) async =>
      await post('program', program);

  Future<Response> deleteProgram(int id) async => await delete('program/$id');
}
