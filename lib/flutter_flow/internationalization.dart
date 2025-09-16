import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['it', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? itText = '',
    String? enText = '',
  }) =>
      [itText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding_01
  {
    '0kynm3d2': {
      'it': 'Salta',
      'en': '',
    },
    'j507r2u2': {
      'it': 'Benvenuto\nin Foodography!',
      'en': '',
    },
    '7xkhcawo': {
      'it': 'L\'aap che soddisfa i tuoi gusti. Letteralmente!',
      'en': '',
    },
    '7w27cxg4': {
      'it': 'Inizia',
      'en': '',
    },
    't1uwketo': {
      'it': 'Home',
      'en': '',
    },
  },
  // Onboarding_02
  {
    '8e36jppw': {
      'it': 'Salta',
      'en': '',
    },
    'fqvpwkwf': {
      'it': 'Scopri il\npiatto perfetto!',
      'en': '',
    },
    'dcoi4fdf': {
      'it':
          'Cerca il piatto che incontra il tuo gusto. Ingredienti di alta qualità a portata di mano.',
      'en': '',
    },
    '25yjnsq2': {
      'it': 'Indietro',
      'en': '',
    },
    'dr8cjjay': {
      'it': 'Avanti',
      'en': '',
    },
    'lsgyjtqm': {
      'it': 'Home',
      'en': '',
    },
  },
  // Onboarding_03
  {
    'icxq044e': {
      'it': 'Salta',
      'en': '',
    },
    'yh7jh9uj': {
      'it': 'Goditi il tuo\npiatto preferito!',
      'en': '',
    },
    'a35pf3ql': {
      'it':
          'Ti diamo il benvenuto. Goditi il tuo tempo e i tuoi piatti preferiti.',
      'en': '',
    },
    'xf9k7kdr': {
      'it': 'Indietro',
      'en': '',
    },
    'rq920t2v': {
      'it': 'Avanti',
      'en': '',
    },
    '56y7l1l0': {
      'it': 'Home',
      'en': '',
    },
  },
  // Inizia
  {
    '4y6roroo': {
      'it': 'Continua con Apple',
      'en': '',
    },
    'bdx72dms': {
      'it': 'Continua con Google',
      'en': '',
    },
    '0iggohg6': {
      'it': 'Continua con Email',
      'en': '',
    },
    'eg63w2ox': {
      'it':
          'Continuando accetti la nostra Privacy Policy\ne i nostri Termini di Utilizzo',
      'en': '',
    },
    'iiymex9c': {
      'it': 'Salta',
      'en': '',
    },
    '9omltbrk': {
      'it': 'Home',
      'en': '',
    },
  },
  // Homepage
  {
    'k53u1bac': {
      'it': 'Posizione attuale',
      'en': '',
    },
    '0yg0jzcw': {
      'it': 'Cosa vuoi mangiare?',
      'en': '',
    },
    's77653qf': {
      'it': 'I piatti vicino a te',
      'en': '',
    },
    'msmreqzh': {
      'it': 'Linguine Cacio e Pepe',
      'en': '',
    },
    '4iiryri4': {
      'it': 'Dar Bruttone',
      'en': '',
    },
    '7bjaomkk': {
      'it': 'Pennette all’amatriciana',
      'en': '',
    },
    '1iatp5o5': {
      'it': 'Dar Bruttone',
      'en': '',
    },
    'b69pdxge': {
      'it': 'Filiere in evidenza',
      'en': '',
    },
    'zysaoln7': {
      'it': 'Giovanna Rana',
      'en': '',
    },
    'sz9gn3hp': {
      'it': 'Filiera integrata',
      'en': '',
    },
    '27jrfjly': {
      'it': 'Giovanna Rana',
      'en': '',
    },
    '3hhml0kt': {
      'it': 'Filiera integrata',
      'en': '',
    },
    'zpa1ik14': {
      'it': 'Viaggio nel gusto',
      'en': '',
    },
    'h9x929in': {
      'it': 'Una cucina che parla tutte le lingue',
      'en': '',
    },
    'bhbjesku': {
      'it': 'Dalla foglia d’alloro al pepe nero: il mondo in un morso.',
      'en': '',
    },
    'lgnzj9dz': {
      'it': 'I sapori dell’Est',
      'en': '',
    },
    'dp8vfxim': {
      'it': 'Un viaggio tra spezie, aromi e tradizioni orientali.',
      'en': '',
    },
    '19tn6qgb': {
      'it': 'I foodography del momento',
      'en': '',
    },
    'ed99kktf': {
      'it': '1°',
      'en': '',
    },
    'yguofzhb': {
      'it': 'Crema romana',
      'en': '',
    },
    'y48vqxzn': {
      'it': '2°',
      'en': '',
    },
    'mca6pwz8': {
      'it': 'Note d\'orto',
      'en': '',
    },
    'ecm51r5s': {
      'it': 'Esplora',
      'en': '',
    },
  },
  // Diario
  {
    'p2cexxw6': {
      'it': 'Diario',
      'en': '',
    },
  },
  // Camera
  {
    'yqjeytqe': {
      'it': 'Camera',
      'en': '',
    },
  },
  // Profilo
  {
    'jwb58ze2': {
      'it': 'Joy Augustin',
      'en': '',
    },
    'mw1w8z7p': {
      'it': '6 recensioni pubblicate',
      'en': '',
    },
    'fcheom0g': {
      'it': 'Account',
      'en': '',
    },
    '2udamf18': {
      'it': 'Modifica profilo',
      'en': '',
    },
    '859owwlu': {
      'it': 'Impostazioni di notifica',
      'en': '',
    },
    'bl7xb5rz': {
      'it': 'Country',
      'en': '',
    },
    '3qaybcdu': {
      'it': 'Generale',
      'en': '',
    },
    '68z8dco5': {
      'it': 'Supporto account',
      'en': '',
    },
    'zln79fdc': {
      'it': 'Termini di servizio',
      'en': '',
    },
    '1nybur28': {
      'it': 'Logout',
      'en': '',
    },
    '98uwn33y': {
      'it': 'Profilo',
      'en': '',
    },
  },
  // Search
  {
    '8kvcijfi': {
      'it': 'Cosa vuoi mangiare?',
      'en': '',
    },
    '8t0njbsu': {
      'it': 'Le ultime ricerche',
      'en': '',
    },
    '5ge7lssb': {
      'it': 'Linguine Cacio e Pepe',
      'en': '',
    },
    'e3bcahpp': {
      'it': 'Dar Bruttone, Via Taranto, 118',
      'en': '',
    },
    'mqe9cea9': {
      'it': 'Fettuccine all’Amatriciana',
      'en': '',
    },
    'y5vixo2c': {
      'it': 'Il Matriciano, Via dei Gracchi, 55',
      'en': '',
    },
    'a28r7hmv': {
      'it': 'I più cercati vicino a te',
      'en': '',
    },
    '8rx9gfmw': {
      'it': 'Linguine Cacio e Pepe',
      'en': '',
    },
    'woy8zai1': {
      'it': 'Dar Bruttone, Via Taranto, 118',
      'en': '',
    },
    '0v0sto6b': {
      'it': 'Spaghetti alla Carbonara',
      'en': '',
    },
    'txrbfm58': {
      'it': 'Da Felice a Testaccio, Via Mastro\nGiorgio, 29',
      'en': '',
    },
    '7289rjzc': {
      'it': 'Fettuccine all’Amatriciana',
      'en': '',
    },
    'lite8pc0': {
      'it': 'Il Matriciano, Via dei Gracchi, 55',
      'en': '',
    },
    'pq6ebruj': {
      'it': 'Vedi mappa',
      'en': '',
    },
    '6x8bo3fe': {
      'it': 'Home',
      'en': '',
    },
  },
  // Filters
  {
    'qkl0ne97': {
      'it': 'Filtri',
      'en': '',
    },
    '2364z8yc': {
      'it': 'Ordinamento',
      'en': '',
    },
    'qi9mxzl8': {
      'it': 'Più recenti',
      'en': '',
    },
    '0e704n5v': {
      'it': 'Più votati',
      'en': '',
    },
    'l06pwuvy': {
      'it': 'Più vecchi',
      'en': '',
    },
    '7xsjsdzf': {
      'it': 'Preferiti',
      'en': '',
    },
    'uvgai32y': {
      'it': 'Per ristorante',
      'en': '',
    },
    'gxiw8kla': {
      'it': 'Dar Bruttone',
      'en': '',
    },
    'p7jaggxz': {
      'it': 'Il Matriciano',
      'en': '',
    },
    '5vbbb2u8': {
      'it': 'Da Felice a Testaccio',
      'en': '',
    },
    '9the0k5y': {
      'it': 'Per area geografica',
      'en': '',
    },
    'qoxw9i21': {
      'it': 'Roma',
      'en': '',
    },
    'smobnc0x': {
      'it': 'Milano',
      'en': '',
    },
    'gntvgjgb': {
      'it': 'Napoli',
      'en': '',
    },
    'zmy0fb17': {
      'it': 'Torino',
      'en': '',
    },
    '3f0q3amj': {
      'it': 'Vedi altri',
      'en': '',
    },
    'yu2ir5h8': {
      'it': 'Per tipo di cucina',
      'en': '',
    },
    'mmb59u24': {
      'it': 'Italiana',
      'en': '',
    },
    'oz7j2pfp': {
      'it': 'Asiatica',
      'en': '',
    },
    'ngaic8fx': {
      'it': 'Vegan',
      'en': '',
    },
    'dtw3v1od': {
      'it': 'Dessert',
      'en': '',
    },
    'f9l8i7vg': {
      'it': 'Per valutazione',
      'en': '',
    },
    'xcyzvck9': {
      'it': '5',
      'en': '',
    },
    'u12zc45f': {
      'it': '4+',
      'en': '',
    },
    'dy3clk13': {
      'it': '3+',
      'en': '',
    },
    'sjufdr2j': {
      'it': '2+',
      'en': '',
    },
    '2l4t8ruw': {
      'it': 'Annulla',
      'en': '',
    },
    'uy8f2r5n': {
      'it': 'Applica',
      'en': '',
    },
    '3dr3jluq': {
      'it': 'Home',
      'en': '',
    },
  },
  // Detail
  {
    'u9u2zsn3': {
      'it': 'Linguine Cacio e pepe',
      'en': '',
    },
    '6pfpwt8n': {
      'it': 'Dar Bruttone',
      'en': '',
    },
    'ddjqlghk': {
      'it': '4.6/',
      'en': '',
    },
    'h0aeoomw': {
      'it': '5',
      'en': '',
    },
    'd4svwwli': {
      'it': 'Description',
      'en': '',
    },
    'nuwchm19': {
      'it':
          'Non so se la bellezza salverà il mondo ma sicuramente aiuta. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'en': '',
    },
    '2n5uu6vh': {
      'it': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '1280d3ho': {
      'it': '',
      'en': '',
    },
    'm509drw9': {
      'it': '',
      'en': '',
    },
    'dhnfkqoc': {
      'it': '',
      'en': '',
    },
    'miwg2ov0': {
      'it': '',
      'en': '',
    },
    'mnna6o4d': {
      'it': '',
      'en': '',
    },
    'c53mm8e1': {
      'it': '',
      'en': '',
    },
    'tbezuni3': {
      'it': '',
      'en': '',
    },
    'dd41yh71': {
      'it': '',
      'en': '',
    },
    '5vp1lbie': {
      'it': '',
      'en': '',
    },
    'iwnhp1yh': {
      'it': '',
      'en': '',
    },
    'abvcrk61': {
      'it': '',
      'en': '',
    },
    'ac3rx4n7': {
      'it': '',
      'en': '',
    },
    'k7tlkpli': {
      'it': '',
      'en': '',
    },
    '54i3rlvu': {
      'it': '',
      'en': '',
    },
    'hy8cl2cm': {
      'it': '',
      'en': '',
    },
    '20p5mew4': {
      'it': '',
      'en': '',
    },
    '77e0f6bx': {
      'it': '',
      'en': '',
    },
    'gmmggzaz': {
      'it': '',
      'en': '',
    },
    'cv5rojgo': {
      'it': '',
      'en': '',
    },
    'zfivclu3': {
      'it': '',
      'en': '',
    },
    '93knlfe2': {
      'it': '',
      'en': '',
    },
    '1wgafhc7': {
      'it': '',
      'en': '',
    },
    'eixe18v2': {
      'it': '',
      'en': '',
    },
    'gglwy4e4': {
      'it': '',
      'en': '',
    },
    'ftjcr7jf': {
      'it': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
