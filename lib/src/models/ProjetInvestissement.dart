class ProjetInvestissement {

  const ProjetInvestissement(
    {this.typeInvestisseur,
    this.nbVisites,
    this.typePersonnesInclus,
    this.typeBiens,
    this.surfaceMin,
    this.budgetMax,
    this.localisation,
    this.montantApport});

  final String typeInvestisseur;
  final String typePersonnesInclus;
  final String typeBiens;
  //final int nbAchats;
  final int montantApport;
  final double surfaceMin;
  final double budgetMax;
  final String nbVisites;
  final String localisation;


  ProjetInvestissement copyWith({String typeInvestisseur, String localisation, double surfaceMin, double budgetMax, String typePersonnesInclus, String typeBiens, int montantApport, String nbVisites}) {
    return ProjetInvestissement(
      typeInvestisseur: typeInvestisseur ?? this.typeInvestisseur,
      surfaceMin: surfaceMin ?? surfaceMin,
      typePersonnesInclus: typePersonnesInclus ?? this.typePersonnesInclus,
      typeBiens: typeBiens ?? this.typeBiens,
      montantApport: montantApport ?? this.montantApport,
      nbVisites: nbVisites ?? this.nbVisites,
      budgetMax: budgetMax ?? this.budgetMax,
      localisation: localisation ?? this.localisation
    );
  }
}
