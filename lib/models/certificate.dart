class Certificate {
  String jenisSertifikat;
  String namaSertifikat;
  String noSertifikat;
  DateTime tanggalTerbit;
  DateTime masaBerlaku;
  String tahunPeriode;
  String penyelenggara;
  String filePath;

  Certificate({
    required this.jenisSertifikat,
    required this.namaSertifikat,
    required this.noSertifikat,
    required this.tanggalTerbit,
    required this.masaBerlaku,
    required this.tahunPeriode,
    required this.penyelenggara,
    required this.filePath,
  });
}
