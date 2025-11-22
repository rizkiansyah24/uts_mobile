enum StudentStatus { aktif, cuti, lulus }

class Profile {
  final String name;
  final String nim;
  final String jurusan;
  final String alamat;
  final StudentStatus status;
  final String kontak;
  final String email;
  final List<String> skills;
  final List<String> hobbies;

  Profile({
    required this.name,
    required this.nim,
    required this.jurusan,
    required this.alamat,
    required this.status,
    required this.kontak,
    required this.email,
    required this.skills,
    required this.hobbies,
  });
}
