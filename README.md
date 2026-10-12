<div align="center">

<br/>

# tMinus1

### 🪙 Cryptocurrency Tracker & Portfolio Manager

*A sleek, offline-first Flutter app powered by CoinGecko — built with Clean Architecture, BLoC state management, and a premium dark UI.*

<br/>

[![Flutter](https://img.shields.io/badge/Flutter_SDK-3.11.3+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11.3+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![CoinGecko](https://img.shields.io/badge/API-CoinGecko_v3-8DC63F?style=for-the-badge&logo=bitcoin&logoColor=white)](https://www.coingecko.com/en/api)
[![Architecture](https://img.shields.io/badge/Clean-Architecture-6EC4A1?style=for-the-badge&logo=databricks&logoColor=white)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![State](https://img.shields.io/badge/State-BLoC_%2F_Cubit-7B68EE?style=for-the-badge&logo=redux&logoColor=white)](https://bloclibrary.dev)
[![DB](https://img.shields.io/badge/Database-SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://pub.dev/packages/sqflite)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

<br/>

[✨ Features](#-features) · [🎨 Design System](#-design-system) · [🛠 Tech Stack](#-tech-stack) · [🏛 Architecture](#-architecture)

<br/>

---

</div>

## 📖 About

**tMinus1** is a high-performance, beautifully crafted mobile application built with **Flutter** that empowers crypto enthusiasts and active traders to:

- 📈 **Monitor** live cryptocurrency markets and real-time prices via CoinGecko
- 📊 **Visualize** sparkline price trends using dynamic, color-reactive charts
- 💼 **Manage** a personal portfolio with persistent offline SQLite storage

Designed with a modern **dark theme**, bespoke **Neue Montreal** typography, and a **floating navigation dock**, tMinus1 follows **Clean Architecture** and SOLID principles for maintainability at scale.

---

## ✨ Features

<table>
<tr>
<td width="50%" valign="top">

### 📊 Real-Time Market Intelligence

- **Live Data** from CoinGecko API v3 — prices, volume, 24h change
- **Trending Coins** carousel on the home dashboard
- **Top Coins** by market cap (top 10)
- **Sparkline Charts** dynamically colored:
  - 🟢 Mint green → price up
  - 🔴 Soft crimson → price down

</td>
<td width="50%" valign="top">

### 💼 Portfolio & Wallet Manager

- **Offline-First** — SQLite-backed, no sign-in required
- **One-Tap Add** to wallet from the Markets screen
- **Animated Favorite Toggle** with scale transition
- **Portfolio Balance** auto-calculated in USD
- **Long-Press Delete** with confirmation dialog

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 🎨 Premium UI / UX Design

- **Dark Theme** — charcoal surfaces, emerald mint accents
- **Neue Montreal** custom font (7 weights + italics)
- **Floating Navigation Dock** with animated tab labels
- **Onboarding Carousel** with animated dot indicators
- **Auth Toggle** — Sign In / Sign Up with Google & Facebook
- **Image Caching** via `cached_network_image`
- **Lottie Animations** on splash screen

</td>
</tr>
</table>

---

## 🎨 Design System

<div align="center">

| Token | Value | Preview |
|-------|-------|---------|
| `primary` | `#6EC4A1` | ![#6EC4A1](https://img.shields.io/badge/-%236EC4A1-6EC4A1?style=flat-square) |
| `darkBackground` | `#1B232A` | ![#1B232A](https://img.shields.io/badge/-%231B232A-1B232A?style=flat-square) |
| `darkSurface` | `#212931` | ![#212931](https://img.shields.io/badge/-%23212931-212931?style=flat-square) |
| `error` | `#DD4B4B` | ![#DD4B4B](https://img.shields.io/badge/-%23DD4B4B-DD4B4B?style=flat-square) |
| `warning` | `#F7931A` | ![#F7931A](https://img.shields.io/badge/-%23F7931A-F7931A?style=flat-square) |
| `success` | `#34A853` | ![#34A853](https://img.shields.io/badge/-%2334A853-34A853?style=flat-square) |

**Typography:** `Neue Montreal` — Light · Regular · Medium · Bold (+ Italic variants)

</div>

---

## 🛠 Tech Stack

### 🧩 Core Framework

| Technology | Version | Role |
|---|---|---|
| **Flutter** | `^3.11.3` | Cross-platform UI toolkit (Material 3) |
| **Dart** | `^3.11.3` | Strongly typed, client-optimized language |

### 🔄 State Management & Logic

| Package | Version | Role |
|---|---|---|
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | `^9.1.1` | Reactive BLoC / Cubit pattern |
| [`equatable`](https://pub.dev/packages/equatable) | `^2.0.8` | Value equality for states & models |
| [`dartz`](https://pub.dev/packages/dartz) | `^0.10.1` | `Either<Failure, Success>` functional error handling |

### 🌐 Networking

| Package | Version | Role |
|---|---|---|
| [`dio`](https://pub.dev/packages/dio) | `^5.9.2` | HTTP client with 30s timeout & interceptors |
| [`pretty_dio_logger`](https://pub.dev/packages/pretty_dio_logger) | `^1.4.0` | Prettified request/response logs |
| **CoinGecko API v3** | — | Live market data provider |

### 🗄 Persistence & Storage

| Package | Version | Role |
|---|---|---|
| [`sqflite`](https://pub.dev/packages/sqflite) | `^2.3.0` | On-device SQLite wallet database |
| [`path_provider`](https://pub.dev/packages/path_provider) | `^2.1.2` | Filesystem path access (Android & iOS) |
| [`path`](https://pub.dev/packages/path) | `^1.8.3` | Path manipulation utilities |

### 💉 Dependency Injection

| Package | Version | Role |
|---|---|---|
| [`get_it`](https://pub.dev/packages/get_it) | `^9.2.1` | Service locator with lazy singleton & factory registration |

### 🖼 UI, Charts & Animations

| Package | Version | Role |
|---|---|---|
| [`fl_chart`](https://pub.dev/packages/fl_chart) | `^1.2.0` | Sparkline & price trend line charts |
| [`flutter_svg`](https://pub.dev/packages/flutter_svg) | `^2.0.16` | SVG icons & illustrations renderer |
| [`cached_network_image`](https://pub.dev/packages/cached_network_image) | `^3.4.1` | Cached coin icons with fallback placeholders |
| [`animated_toggle_switch`](https://pub.dev/packages/animated_toggle_switch) | `^0.8.7` | Smooth auth Sign In / Sign Up toggle |
| [`lottie`](https://pub.dev/packages/lottie) | `^3.3.2` | JSON vector animation playback |
| [`easy_localization`](https://pub.dev/packages/easy_localization) | `^3.0.8` | i18n & multi-language support |

### 🔧 Code Generation

| Package | Version | Role |
|---|---|---|
| [`json_annotation`](https://pub.dev/packages/json_annotation) | `^4.11.0` | Annotations for model serialization |
| [`json_serializable`](https://pub.dev/packages/json_serializable) | `^6.13.1` | Auto-generates `.g.dart` model files |
| [`build_runner`](https://pub.dev/packages/build_runner) | `^2.4.5` | Dart build & code generation pipeline |

---

## 🏛 Architecture

tMinus1 strictly follows **Clean Architecture** with 4 clearly separated layers:

```
╔══════════════════════════════════════════════════════════════╗
║  🖥  PRESENTATION LAYER                                      ║
║  Screens · Widgets · Cubits (HomeCubit, MarketsCubit,        ║
║  WalletCubit) · BLoC States                                  ║
╠══════════════════════════════════════════════════════════════╣
║  📐  DOMAIN LAYER                ← Pure Dart, no frameworks  ║
║  Entities (Coin) · Use Cases (GetCoinsUseCase,               ║
║  GetMarketsUseCase) · Repository Interfaces                   ║
╠══════════════════════════════════════════════════════════════╣
║  🗂  DATA LAYER                                              ║
║  Remote Datasources (Dio + CoinGecko) · Local Datasource     ║
║  (SQLite) · DTOs · json_serializable · Repo Implementations  ║
╠══════════════════════════════════════════════════════════════╣
║  ⚙️  CORE LAYER                                              ║
║  DI (GetIt) · Routing (AppRouter) · Theme (AppColors)        ║
║  Networking (DioFactory) · Shared Widgets                    ║
╚══════════════════════════════════════════════════════════════╝
```

**Key patterns applied:**

- ✅ **Repository Pattern** — abstract contracts → concrete implementations
- ✅ **Use Case Pattern** — single-responsibility business operations
- ✅ **Functional Error Handling** — `Either<RemoteFailure, T>` via Dartz
- ✅ **Service Locator DI** — GetIt with `registerLazySingleton` & `registerFactory`

---

## 🌐 API Reference

**Base URL:** `https://api.coingecko.com/api/v3/`

| Endpoint | Method | Used In | Description |
|---|---|---|---|
| `search/trending` | `GET` | Home → Recent Coins | Trending cryptocurrencies (top 10) |
| `coins/markets` | `GET` | Home → Top Coins | Market cap leaders with 7-day sparklines |
| `coins/markets` | `GET` | Markets Screen | Full market list with 24h change |

**Common Query Parameters:**

```
vs_currency  = usd
order        = market_cap_desc
per_page     = 10
sparkline    = true    ← includes 7-day price history
```

> **Note:** tMinus1 uses the free CoinGecko public API. No API key is required for basic usage, but rate limits apply (10–30 calls/min on the free tier).

---

## 💾 Local Database Schema

**Database:** `crypto_wallet.db` · **Engine:** SQLite via `sqflite`

```sql
CREATE TABLE wallet_assets (
    id         INTEGER  PRIMARY KEY AUTOINCREMENT,
    coin_id    TEXT     NOT NULL,           -- CoinGecko ID  (e.g. "bitcoin")
    name       TEXT     NOT NULL,           -- Display name  (e.g. "Bitcoin")
    symbol     TEXT     NOT NULL,           -- Ticker        (e.g. "BTC")
    amount     REAL     NOT NULL DEFAULT 0, -- Holdings quantity
    usd_value  REAL     NOT NULL DEFAULT 0, -- Current USD price
    icon_path  TEXT     NOT NULL DEFAULT '' -- Remote icon URL
);
```

**Supported operations:** `INSERT` · `SELECT ALL` · `SELECT BY ID` · `UPDATE` · `DELETE` · `DELETE ALL`

---

### Setup & Run

```bash
# 1️⃣  Clone the repository
git clone https://github.com/your-username/tMinus1.git
cd tMinus1

# 2️⃣  Install Flutter dependencies
flutter pub get

# 3️⃣  Generate JSON model files (json_serializable)
dart run build_runner build --delete-conflicting-outputs

# 4️⃣  Run on a connected device or emulator
flutter run
```

> 💡 **Tip:** Run `flutter devices` to list available emulators and physical devices before step 4.

---
<div align="center">

Built with ❤️ using **Flutter** &nbsp;·&nbsp; Powered by **CoinGecko API**

⭐ *If you found this project useful, consider leaving a star!*

</div>
