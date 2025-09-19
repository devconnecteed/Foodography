# Configurazione Google Maps per Foodography

## Passaggi per configurare Google Maps

### 1. Ottenere una chiave API di Google Maps

1. Vai su [Google Cloud Console](https://console.cloud.google.com/)
2. Crea un nuovo progetto o seleziona un progetto esistente
3. Abilita le seguenti API:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Places API (opzionale, per funzionalità avanzate)

### 2. Configurare la chiave API

1. Apri il file `android/app/src/main/AndroidManifest.xml`
2. Sostituisci `YOUR_GOOGLE_MAPS_API_KEY` con la tua chiave API reale:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="LA_TUA_CHIAVE_API_QUI" />
```

### 3. Configurare iOS

1. Apri il file `ios/Runner/AppDelegate.swift`
2. Sostituisci `YOUR_GOOGLE_MAPS_API_KEY` con la tua chiave API reale:

```swift
import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("LA_TUA_CHIAVE_API_QUI")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

3. I permessi di localizzazione sono già configurati nel file `ios/Runner/Info.plist`

### 4. Restrizioni di sicurezza (raccomandato)

Per sicurezza, configura le restrizioni della chiave API:

1. **Restrizioni per applicazione**: Limita la chiave solo alla tua app
2. **Restrizioni per API**: Limita solo alle API necessarie
3. **Restrizioni per IP**: Se necessario, limita a specifici IP

### 5. Testare la mappa

Una volta configurata la chiave API, la mappa dovrebbe funzionare correttamente e mostrare:
- La zona del Vaticano centrata
- 5 ristoranti con marker rossi
- Informazioni sui piatti tipici romani
- Funzionalità di geolocalizzazione

## Note

- La mappa è configurata per mostrare la zona del Vaticano con ristoranti tipici romani
- I marker mostrano nome del ristorante, piatto specialità e rating
- Il pulsante "Vicino a me" utilizza la geolocalizzazione per centrare la mappa sulla posizione dell'utente
