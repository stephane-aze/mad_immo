
class ProjetAchat {
  const ProjetAchat(
      {this.budgetMax,
      this.localisation,
      this.typeAcquereur,
      this.typePersonnesInclus,
      this.typeBiens,
      this.surfaceMin,
      this.nbAchats,
      this.montantApport,
      this.priseDeContact,
      this.connaissanceNotaire,
      this.nbVisites});

  final String typeAcquereur;
  final String typePersonnesInclus;
  final String typeBiens;
  final int nbAchats;
  final double surfaceMin;
  final int montantApport;
  final bool priseDeContact;
  final bool connaissanceNotaire;
  final double budgetMax;
  final String localisation;
  final String nbVisites;

  ProjetAchat copyWith(
      {String typeAcquereur,
      String typePersonnesInclus,
      String typeBiens,
      int nbAchats,
      int montantApport,
      double surfaceMin,
      bool priseDeContact,
      bool connaissanceNotaire,
      double budgetMax,
      String localisation,
      String nbVisites}) {
    return ProjetAchat(
      typeAcquereur: typeAcquereur ?? this.typeAcquereur,
      typePersonnesInclus: typePersonnesInclus ?? this.typePersonnesInclus,
      typeBiens: typeBiens ?? this.typeBiens,
      nbAchats: nbAchats ?? this.nbAchats,
      surfaceMin: surfaceMin ?? this.surfaceMin,
      montantApport: montantApport ?? this.montantApport,
      priseDeContact: priseDeContact ?? this.priseDeContact,
      connaissanceNotaire: connaissanceNotaire ?? this.connaissanceNotaire,
      localisation: localisation ?? this.localisation,
      budgetMax: budgetMax ?? this.budgetMax,
      nbVisites: nbVisites ?? nbVisites
    );
  }
}
