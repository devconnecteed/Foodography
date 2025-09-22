#!/bin/bash

# Script per risolvere l'errore "database is locked" di Xcode
# Termina processi e pulisce cache per sbloccare il database

echo "🔧 Risoluzione errore database bloccato..."

# Vai nella directory del progetto
cd "$(dirname "$0")"

echo "📁 Directory corrente: $(pwd)"

# Termina tutti i processi Flutter e Xcode
echo "🛑 Terminando processi in background..."
pkill -f "flutter run" 2>/dev/null || true
pkill -f "Xcode" 2>/dev/null || true
pkill -f "Simulator" 2>/dev/null || true

# Aspetta un momento per assicurarsi che i processi siano terminati
sleep 2

# Rimuovi database bloccati di Xcode
echo "🗑️ Rimuovendo database bloccati di Xcode..."
rm -rf ~/Library/Developer/Xcode/DerivedData/Runner-* 2>/dev/null || true

# Esegui flutter clean
echo "🧹 Eseguendo flutter clean..."
flutter clean

# Esegui flutter pub get
echo "📚 Eseguendo flutter pub get..."
flutter pub get

# Esegui pod install se necessario
if [ -d "ios" ]; then
    echo "📦 Eseguendo pod install..."
    cd ios
    pod install
    cd ..
fi

echo "✅ Risoluzione completata!"
echo "🚀 Ora puoi avviare l'anteprima con: flutter run --debug"
