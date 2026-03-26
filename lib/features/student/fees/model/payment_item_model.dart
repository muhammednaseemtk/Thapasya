class PaymentItemModel {
  final String month;
  final String date;
  final String receipt;
  final String amount;
  final String status; 
  
  PaymentItemModel({
    required this.month,
    required this.date,
    required this.receipt,
    required this.amount,
    required this.status,
  });
}