class DiseaseTomatoLeaf {
  final String label;
  final double confidence;
  const DiseaseTomatoLeaf(this.label, this.confidence);

  get confidencePercent => (confidence * 100).toStringAsFixed(2);
}
