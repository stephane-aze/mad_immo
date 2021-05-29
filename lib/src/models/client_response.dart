class ClientResponse {
  int id;
  String nom;
  String prenom;
  String email;
  String emailPerso;
  List<String> roles;
  List<String> secteurs;
  int manager;
  String accessToken;

  ClientResponse(
      {this.id,
      this.nom,
      this.prenom,
      this.email,
      this.emailPerso,
      this.roles,
      this.secteurs,
      this.manager,
      this.accessToken});

  ClientResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    emailPerso = json['emailPerso'];
    roles = json['roles'].cast<String>();
    secteurs = json['secteurs'].cast<String>();
    manager = json['manager'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['emailPerso'] = this.emailPerso;
    data['roles'] = this.roles;
    data['secteurs'] = this.secteurs;
    data['manager'] = this.manager;
    data['accessToken'] = this.accessToken;
    return data;
  }
}