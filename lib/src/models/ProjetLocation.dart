
class ProjetLocation {
  const ProjetLocation(
      {this.typeLocataire,
      this.typeBiens,
      this.surfaceMin,
      this.hasGarant,
      this.budgetMax,
      this.localisation,
      this.nbVisites});

  final String typeLocataire;
  final String typeBiens;
  final double surfaceMin;
  final bool hasGarant;
  final double budgetMax;
  final String localisation;
  final String nbVisites;

  ProjetLocation copyWith(
      {String typeLocataire,
      String typeBiens,
      double surfaceMin,
      double budgetMax,
      bool hasGarant,
      String localisation,
      String nbVisites}) {
    return ProjetLocation(
        typeLocataire: typeLocataire ?? this.typeLocataire,
        hasGarant: hasGarant ?? this.hasGarant,
        typeBiens: typeBiens ?? this.typeBiens,
        localisation: localisation ?? this.localisation,
        surfaceMin: surfaceMin ?? this.surfaceMin,
        nbVisites: nbVisites ?? this.nbVisites,
        budgetMax: budgetMax ?? this.budgetMax);
  }
}
