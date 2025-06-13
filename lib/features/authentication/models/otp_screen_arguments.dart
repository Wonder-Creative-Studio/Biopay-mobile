class OtpScreenArguments {
  final String title;
  final String description;
  final Function() onVerify;
  final Function() onResend;

  OtpScreenArguments({
    required this.title,
    required this.description,
    required this.onVerify,
    required this.onResend,
  });
}
