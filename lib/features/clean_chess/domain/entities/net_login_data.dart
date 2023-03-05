class Account {
  // TODO: Add fields received from the API call
  final String username;

  const Account({required this.username});

  Account.fromJson(Map<String, dynamic> json) : username = json['username'];
}
