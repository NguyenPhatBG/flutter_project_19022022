class LoginForRequest {
  final String email, password;

  LoginForRequest(this.email, this.password);

  Map<String, dynamic> toJsonForAdd() {
    return {"email": email, "password": password};
  }
}
