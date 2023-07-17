enum CategoryMedicinalPlant {
  adesmiaBijuga('Adesmia bijuga', 'adesmia_bijuga'),
  alliumSativumGarlic('Allium sativum (Garlic)', 'allium_sativum'),
  altamiza('Altamiza', 'altamiza'),
  amaranto('Amaranto', 'amaranto'),
  ballotaAcetabulosa('Ballota acetabulosa', 'ballota_acetabulosa'),
  blumeaBalsamifera('Blumea balsamifera', 'blumea_balsamifera'),
  calahuala('Calahuala', 'calahuala'),
  carneHumana('Carne humana', 'carne_humana'),
  cedron('Cedron', 'cedron'),
  chilpetin('Chilpetin', 'chilpetin'),
  chimpu('Chimpu', 'chimpu'),
  chulco('Chulco', 'chulco'),
  clavel('Clavel', 'clavel'),
  clavelRosaBeso('Clavel Rosa Beso', 'clavel_rosa_beso'),
  colaCaballo('Cola Caballo', 'cola_caballo'),
  combretumIndicum('Combretum indicum', 'combretum_indicum'),
  desiertoFourOClock('Desierto Four OClock', 'desierto_four_oclock'),
  diantheraSecunda('Dianthera Secunda', 'dianthera_secunda'),
  dienteLeon('Diente Leon', 'diente_leon'),
  ehretiaMicrophylla('Ehretia microphylla', 'ehretia_microphylla'),
  epazote('Epazote', 'epazote'),
  hiervaLuisa('Hierva Luisa', 'hierva_luisa'),
  higo('Higo', 'higo'),
  iresineHerbstii('Iresine herbstii', 'iresine_herbstii'),
  lavandaGoodwin('Lavanda goodwin', 'lavanda_goodwin'),
  limaLimon('Lima Limon', 'lima_limon'),
  llanten('Llánten', 'llanten'),
  malvaRosa('Malva Rosa', 'malva_rosa'),
  manzanilla('Manzanilla', 'manzanilla'),
  menta('Menta', 'menta'),
  mentha('Mentha', 'mentha'),
  momordicaCharantia('Momordica charantia', 'momordica_charantia'),
  orejaBurro('Oreja Burro', 'oreja_burro'),
  oxalisLatifolia('Oxalis latifolia', 'oxalis_latifolia'),
  penaPena('Pena Pena', 'pena_pena'),
  peperomiaPellucida('Peperomia pellucida', 'peperomia_pellucida'),
  psidiumGuajava('Psidium guajava', 'psidium_guajava'),
  romero('Romero', 'romero'),
  ruda('Ruda', 'ruda'),
  santaMaria('Santa María', 'santa_maria'),
  sennaAlata('Senna alata', 'senna_alata'),
  sabila('Sábila', 'sabila'),
  toronjil('Toronjil', 'toronjil'),
  vitexNegundo('Vitex negundo', 'vitex_negundo'),
  alheli('alhelí', 'alheli'),
  canelon('canelon', 'canelon'),
  suculenta('suculenta', 'suculenta'),
  nachic('Ñachic', 'ñachic');

  final String _name;
  final String _image;

  const CategoryMedicinalPlant(this._name, this._image);

  String get name => _name;
  String get image => _image;

  static CategoryMedicinalPlant categoryByName(String name) {
    for (CategoryMedicinalPlant category in CategoryMedicinalPlant.values) {
      if (category.name == name) {
        return category;
      }
    }
    return CategoryMedicinalPlant.adesmiaBijuga;
  }
}
