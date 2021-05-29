class RolesResponse {
  List<String> roles;
  RolesResponse({this.roles});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    return data;
  }
}
