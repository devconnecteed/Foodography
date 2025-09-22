# 🔧 Fix Errore Database Bloccato Xcode

## ❌ **Problema Riscontrato**

```
unable to attach DB: error: accessing build database '/Users/lucaconnecteed/Library/Developer/Xcode/DerivedData/Runner-hbbtromzsffvwaenhkhtaxjwuqrv/Build/Intermediates.noindex/XCBuildData/build.db': database is locked
Possibly there are two concurrent builds running in the same filesystem location.
```

## ✅ **Soluzione Applicata**

### **1. Terminazione Processi**
```bash
pkill -f "flutter run"
pkill -f "Xcode"
pkill -f "Simulator"
```

### **2. Rimozione Database Bloccati**
```bash
rm -rf ~/Library/Developer/Xcode/DerivedData/Runner-*
```

### **3. Clean e Rebuild**
```bash
flutter clean
flutter pub get
```

### **4. Avvio Anteprima**
```bash
flutter run --debug
```

## 🚀 **Script di Automazione**

Ho creato uno script per automatizzare la risoluzione:

### **risolvi_database_bloccato.sh**
```bash
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
```

### **Utilizzo**
```bash
chmod +x risolvi_database_bloccato.sh
./risolvi_database_bloccato.sh
```

## 🔍 **Causa del Problema**

L'errore si verifica quando:
- Più processi di build sono in esecuzione contemporaneamente
- Il database di build di Xcode è bloccato da un processo precedente
- I file di cache non sono stati puliti correttamente

## 🛠️ **Prevenzione**

Per evitare questo errore in futuro:
1. **Terminare sempre** i processi Flutter prima di riavviare
2. **Chiudere Xcode** prima di eseguire flutter run
3. **Usare lo script** di automazione per fix rapidi
4. **Non eseguire** più build contemporaneamente

## 📊 **Risultato**

- ✅ **Processi terminati**: Flutter, Xcode, Simulator
- ✅ **Database puliti**: Rimossi file bloccati
- ✅ **Clean completato**: Cache pulita
- ✅ **Dipendenze aggiornate**: Pub get eseguito
- ✅ **Anteprima avviabile**: Nessun errore

## 🎯 **Status Finale**

**L'errore del database bloccato è stato risolto e l'anteprima è ora avviabile!** 🚀
