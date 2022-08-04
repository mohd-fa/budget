class Transactions {
  final String transactionId;
  final String transactionName;
  final DateTime date;
  final double amount;

  Transactions(
      {required this.transactionId,
      required this.transactionName,
      required this.amount,
      required this.date});
}
