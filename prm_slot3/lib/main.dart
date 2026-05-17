class Student {
  int id;
  String name;

  Student(this.id, this.name);

  @override
  String toString() {
    return "ID: $id - Name: $name";
  }
}

class StudentRepository {
  Future<List<Student>> getStudents() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      Student(1, "Duy Anh"),
      Student(2, "Hà Chi"),
      Student(3, "Đức Anh"),
    ];
  }

  Stream<Student> liveStudents() async* {
    await Future.delayed(Duration(seconds: 1));
    yield Student(1, "Duy Anh");

    await Future.delayed(Duration(seconds: 1));
    yield Student(2, "Hà Chi");

    await Future.delayed(Duration(seconds: 1));
    yield Student(3, "Đức Anh");
  }
}

void main() async {
  final repo = StudentRepository();

  print("=== Future ===");
  final students = await repo.getStudents();
  for (var s in students) {
    print(s);
  }

  print("\n=== Stream ===");
  await for (var s in repo.liveStudents()) {
    print(s);
  }
}
