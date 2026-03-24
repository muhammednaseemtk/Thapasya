class MonthlyData {
  final String month;
  final int present;
  final int total;

  MonthlyData({
    required this.month,
    required this.present,
    required this.total,
  });

  double get percentage => present / total;
}