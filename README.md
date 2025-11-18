# Tourism App

## Authors

* [@adedwi1808](https://www.github.com/adedwi1808)

---

## Installation

1. Clone repositori ini:

   ```bash
   git clone [<repo-url>](https://github.com/adedwi1808/tourism-app.git)
   ```
2. Buka file `.xcodeproj` di Xcode.
3. Pastikan Swift Package Manager (SPM) mengunduh semua *dependency*:
   * Kingfisher
   
4. Jalankan proyek (Build & Run).

---

## Design

* https://www.figma.com/design/rFCOJn3KDmnavRXY7xKHxh/Tourism-APP?m=auto&t=mRekcYQUOk53ZGRe-6

---

## API Reference

Seluruh API menggunakan `baseURL`:

```
https://tourism-api.dicoding.dev
```

### GET Tempat Wisata

**Endpoint:**

```
GET /list
```

| Parameter | Type   | Location    | Description                        |
| --------- | ------ | ----------- | ---------------------------------- |
| --------- | ------ | ----------- | ---------------------------------- |

---

## Tech Stack

**Client:**

* **UI:** UIKit
* **Arsitektur:** MVVM (Model-View-ViewModel)
* **Networking:** URLSession + Async/Await
* **Image Loading:** Kingfisher
* **Dependency Manager:** Swift Package Manager (SPM)
