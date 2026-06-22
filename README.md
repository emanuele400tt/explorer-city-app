# 🌍 City Explorer App

A dynamic and responsive Flutter application built to showcase beautiful Italian cities. Developed as a core project during an intensive Android Developer Academy, this app highlights modern UI/UX practices, dynamic state management, and seamless cloud database integration.

## ✨ Key Features
* **Cloud Integration (Firebase):** Users can request tour information, which is validated and securely written to a Cloud Firestore database (`richieste_tour` collection) in real-time.
* **Responsive UI:** Implements `LayoutBuilder` to adapt the interface dynamically. It displays a standard `ListView` on mobile screens and switches to a sleek `GridView` on tablets or larger screens (width > 600px).
* **Interactive State Management:** Includes a fully functional "Favorites" system, allowing users to build a custom watchlist of cities.
* **Micro-Animations & Transitions:** Features custom UI elements, such as a pulsing animated favorite icon and smooth `Hero` image transitions between screens.

## 🛠️ Tech Stack
* **Framework:** Flutter
* **Language:** Dart
* **Backend / Database:** Firebase Cloud Firestore
* **Architecture:** Component-based UI with decoupled widgets.

## 🚀 How to run the project
1. Clone the repository:
   ```bash
   git clone [https://github.com/emanuele400tt/explorer-city-app.git](https://github.com/emanuele400tt/explorer-city-app.git)
2. Install dependencies 
    ```bash
    flutter pub get
3. Run the app 
    ```bash
    flutter run

# Versione Italiana

Un'applicazione Flutter dinamica e responsiva creata per esplorare le più belle città italiane. Sviluppata come progetto centrale durante un'Academy per sviluppatori Android, questa app mette in luce l'utilizzo di interfacce moderne, la gestione dello stato e l'integrazione con database in cloud.

## ✨ Funzionalità Principali
* **Integrazione Cloud (Firebase):** Gli utenti possono richiedere informazioni sui tour tramite un form validato. I dati vengono scritti in tempo reale su un database Cloud Firestore (nella collezione `richieste_tour`).
* **Interfaccia Responsiva:** Utilizza `LayoutBuilder` per adattare l'interfaccia. Mostra una classica `ListView` su schermi mobile e passa a una `GridView` strutturata su tablet o schermi larghi (width > 600px).
* **Gestione dello Stato:** Include un sistema di "Preferiti" funzionante, che permette agli utenti di salvare e visualizzare una lista personalizzata di città.
* **Micro-Animazioni e Transizioni:** Presenta elementi UI personalizzati, come un'icona dei preferiti animata e transizioni fluide delle immagini tramite il widget `Hero`.

## 🛠️ Stack Tecnologico
* **Framework:** Flutter
* **Linguaggio:** Dart
* **Backend / Database:** Firebase Cloud Firestore
* **Architettura:** UI basata su componenti e widget modulari.

## 🚀 Come lanciare il progetto
1. Clonare il repository:
   ```bash
   git clone [https://github.com/emanuele400tt/explorer-city-app.git](https://github.com/emanuele400tt/explorer-city-app.git)
2. Installa le dipendenze 
    ```bash
    flutter pub get
3. Avvia l'app
    ```bash
    flutter run