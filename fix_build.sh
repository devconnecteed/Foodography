#!/bin/bash

echo "🔧 Risoluzione automatica problemi build..."

# 1. Terminare tutti i processi
echo "📱 Terminando processi attivi..."
pkill -f "flutter run" 2>/dev/null || true
pkill -f "Xcode" 2>/dev/null || true
pkill -f "Simulator" 2>/dev/null || true

# 2. Pulire database di build bloccati
echo "🗑️ Pulendo database di build..."
rm -rf ~/Library/Developer/Xcode/DerivedData/Runner-* 2>/dev/null || true

# 3. Pulire cache Flutter
echo "🧹 Pulendo cache Flutter..."
flutter clean

# 4. Reinstallare dipendenze
echo "📦 Reinstallando dipendenze..."
flutter pub get

# 5. Reinstallare CocoaPods
echo "🍎 Reinstallando CocoaPods..."
cd ios
pod install
cd ..

# 6. Testare build
echo "🔨 Testando build..."
flutter build ios --no-codesign

# 7. Avviare app
echo "🚀 Avviando app..."
flutter run --debug &

echo "✅ Fix completato! L'app dovrebbe ora funzionare."
echo "📱 Controlla il simulatore o il dispositivo per vedere l'app."
