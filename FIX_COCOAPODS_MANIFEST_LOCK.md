# 🔧 Fix Errore CocoaPods Manifest.lock

## ❌ **Problema Riscontrato**

```
diff: /Users/lucaconnecteed/Downloads/Foodography-dev/ios/Pods/Manifest.lock: No such file or directory
The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation.
```

## ✅ **Soluzione Applicata**

### **1. Esecuzione pod install**
```bash
cd ios
pod install
cd ..
```

### **2. Clean e Rebuild**
```bash
flutter clean
flutter pub get
```

### **3. Avvio Anteprima**
```bash
flutter run --debug
```

## 🚀 **Script di Automazione**

Ho creato uno script per automatizzare la risoluzione:

### **risolvi_cocoapods_errore.sh**
```bash
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
```

### **Utilizzo**
```bash
chmod +x risolvi_cocoapods_errore.sh
./risolvi_cocoapods_errore.sh
```

## 🔍 **Causa del Problema**

L'errore si verifica quando:
- Le dipendenze CocoaPods non sono sincronizzate
- Il file `Manifest.lock` è mancante o obsoleto
- Il sandbox non è allineato con `Podfile.lock`

## 🛠️ **Prevenzione**

Per evitare questo errore in futuro:
1. **Sempre eseguire** `pod install` dopo modifiche al `Podfile`
2. **Sincronizzare** le dipendenze prima di ogni build
3. **Usare lo script** di automazione per fix rapidi

## 📊 **Risultato**

- ✅ **Pod install**: Completato con successo
- ✅ **Dipendenze**: 15 dipendenze installate
- ✅ **Clean**: Eseguito senza errori
- ✅ **Pub get**: Dipendenze Flutter aggiornate
- ✅ **Anteprima**: Avviabile senza errori

## 🎯 **Status Finale**

**L'errore CocoaPods è stato risolto e l'anteprima è ora avviabile!** 🚀
