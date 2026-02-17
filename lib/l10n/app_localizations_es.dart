// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get flutterNotes => 'Notas de Flutter';

  @override
  String get search => 'Buscar...';

  @override
  String get toggleView => 'Alternar Vista';

  @override
  String get sort => 'Ordenar';

  @override
  String get menu => 'Menú';

  @override
  String get home => 'Inicio';

  @override
  String get settings => 'Configuración';

  @override
  String get addItem => 'Añadir Elemento';

  @override
  String selected(Object count) {
    return '$count seleccionados';
  }

  @override
  String get share => 'Compartir';

  @override
  String get delete => 'Eliminar';

  @override
  String get sortAlphabetically => 'Ordenar Alfabéticamente';

  @override
  String get sortByDate => 'Ordenar por Fecha de Modificación';

  @override
  String get customSort => 'Orden Personalizado';

  @override
  String get myNotes => 'Mis Notas';

  @override
  String get imageFromGallery => 'Imagen de la galería';

  @override
  String get title => 'Título';

  @override
  String get useDynamicColors => 'Usar Colores Dinámicos';

  @override
  String get themeMode => 'Modo de Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';
}
