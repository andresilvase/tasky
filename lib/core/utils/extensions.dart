extension RemoveAccents on String {
  String removeAccents() {
    final normalized = replaceAllMapped(
      RegExp(r'[áàâãäåçéèêëíìîïñóòôõöúùûüýÿÁÀÂÃÄÅÇÉÈÊËÍÌÎÏÑÓÒÔÕÖÚÙÛÜÝ]'),
      (match) {
        switch (match.group(0)) {
          case 'á':
          case 'à':
          case 'â':
          case 'ã':
          case 'ä':
          case 'å':
            return 'a';
          case 'ç':
            return 'c';
          case 'é':
          case 'è':
          case 'ê':
          case 'ë':
            return 'e';
          case 'í':
          case 'ì':
          case 'î':
          case 'ï':
            return 'i';
          case 'ñ':
            return 'n';
          case 'ó':
          case 'ò':
          case 'ô':
          case 'õ':
          case 'ö':
            return 'o';
          case 'ú':
          case 'ù':
          case 'û':
          case 'ü':
            return 'u';
          case 'ý':
          case 'ÿ':
            return 'y';
          case 'Á':
          case 'À':
          case 'Â':
          case 'Ã':
          case 'Ä':
          case 'Å':
            return 'A';
          case 'Ç':
            return 'C';
          case 'É':
          case 'È':
          case 'Ê':
          case 'Ë':
            return 'E';
          case 'Í':
          case 'Ì':
          case 'Î':
          case 'Ï':
            return 'I';
          case 'Ñ':
            return 'N';
          case 'Ó':
          case 'Ò':
          case 'Ô':
          case 'Õ':
          case 'Ö':
            return 'O';
          case 'Ú':
          case 'Ù':
          case 'Û':
          case 'Ü':
            return 'U';
          case 'Ý':
            return 'Y';
          default:
            return '';
        }
      },
    );
    return normalized;
  }
}
