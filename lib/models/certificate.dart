class Certificate {
  final String jenisSertifikat;
  final String namaSertifikat;
  final String noSertifikat;
  final DateTime tanggalTerbit;
  final DateTime masaBerlaku;
  final String tahunPeriode;
  final String penyelenggara;
  final String? filePath; // Properti ini bisa null

  Certificate({
    required this.jenisSertifikat,
    required this.namaSertifikat,
    required this.noSertifikat,
    required this.tanggalTerbit,
    required this.masaBerlaku,
    required this.tahunPeriode,
    required this.penyelenggara,
    this.filePath, // Properti ini bisa null
  });
}
