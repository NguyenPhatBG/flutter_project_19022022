class RegisterForRequest {
  final String email, password;

  RegisterForRequest(this.email, this.password);

  Map<String, dynamic> toJsonForAdd() {
    return {"email": email, "password": password};
  }
}
