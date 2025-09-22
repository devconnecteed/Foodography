#!/bin/bash

# Script definitivo per risolvere tutti i problemi di anteprima
# Risolve errori CocoaPods, database bloccati e problemi di build

echo "🔧 Risoluzione definitiva problemi anteprima..."

# Vai nella directory del progetto
cd "$(dirname "$0")"

echo "📁 Directory corrente: $(pwd)"

# Termina tutti i processi in background
echo "🛑 Terminando processi in background..."
pkill -f "flutter run" 2>/dev/null || true
pkill -f "Xcode" 2>/dev/null || true
pkill -f "Simulator" 2>/dev/null || true

# Aspetta un momento
sleep 3

# Rimuovi database bloccati di Xcode
echo "🗑️ Rimuovendo database bloccati..."
rm -rf ~/Library/Developer/Xcode/DerivedData/Runner-* 2>/dev/null || true

# Esegui flutter clean
echo "🧹 Eseguendo flutter clean..."
flutter clean

# Esegui flutter pub get
echo "📚 Eseguendo flutter pub get..."
flutter pub get

# Esegui pod install
echo "📦 Eseguendo pod install..."
cd ios
pod install
cd ..

# Verifica che tutto sia a posto
echo "🔍 Verificando build..."
flutter build apk --debug

if [ $? -eq 0 ]; then
    echo "✅ Build Android riuscito!"
    echo "🚀 Avviando anteprima iOS..."
    flutter run --debug
else
    echo "❌ Build fallito. Controlla gli errori sopra."
    exit 1
fi
