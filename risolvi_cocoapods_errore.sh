#!/bin/bash

# Script per risolvere l'errore CocoaPods "Manifest.lock not found"
# Esegue pod install e clean per sincronizzare le dipendenze

echo "🔧 Risoluzione errore CocoaPods..."

# Vai nella directory del progetto
cd "$(dirname "$0")"

echo "📁 Directory corrente: $(pwd)"

# Esegui pod install nella cartella iOS
echo "📦 Eseguendo pod install..."
cd ios
pod install
cd ..

# Esegui flutter clean
echo "🧹 Eseguendo flutter clean..."
flutter clean

# Esegui flutter pub get
echo "📚 Eseguendo flutter pub get..."
flutter pub get

echo "✅ Risoluzione completata!"
echo "🚀 Ora puoi avviare l'anteprima con: flutter run --debug"
