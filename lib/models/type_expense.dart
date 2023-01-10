class TypeExpense {
  TypeExpense(this.idTypeExpense, this.type, this.image,
      {this.isSelected = false});

  final int idTypeExpense;
  final String image;
  final String type;
  bool isSelected;
}
