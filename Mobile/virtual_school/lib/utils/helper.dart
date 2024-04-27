
String formatNumber(int number) {
  if (number < 1000)
    return number.toString();
  else if (number < 1e6)
    return '${(number / 1000).toStringAsFixed(1)}k';
  else if (number < 1e9)
    return '${(number / 1e6).toStringAsFixed(1)}M';
  else
    return '${(number / 1e9).toStringAsFixed(1)}B';
}

String ratingStars(int number) {
  switch (number) {
    case 1:
      return '⭐';
    case 2:
      return '⭐⭐';
    case 3:
      return '⭐⭐⭐';
    case 4:
      return '⭐⭐⭐⭐';
    case 5:
      return '⭐⭐⭐⭐⭐';
    default:
      return '';
  }
}
