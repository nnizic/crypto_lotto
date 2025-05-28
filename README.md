# 🎰 Crypto-Lotto

Decentralizirana aplikacija za lutriju temeljena na Ethereum blockchainu (Sepolia testnet) s NFT nagradom za dobitnika.

---

## 🚀 Tehnologije

- **Solidity** – pametni ugovori
- **Chainlink Oracle** – dohvat BTC/USD cijene
- **Chainlink Keepers** – automatsko izvlačenje brojeva (planirano?)
- **IPFS (Pinata)** – pohrana NFT metapodataka
- **Vue.js 3** – frontend aplikacija
- **Ethers.js** – komunikacija s blockchainom putem MetaMaska

---

## 🎫 Kako funkcionira Crypto-Lotto?

- Korisnik odabire **7 brojeva** (od 1 do 39) i uplaćuje listić putem Metamaska.
- Jednom dnevno dolazi do **izvlačenja brojeva**, temeljenog na zadnje 3 decimale cijene Bitcoina (BTC/USD) u tom trenutku, putem **Chainlink Price Feeda**.
- Svi listići se uspoređuju s izvučenim brojevima.
- **Pobjednik** je onaj koji ima **najviše pogođenih brojeva (minimalno 4)**.
- Pobjednik dobiva **NFT s trofejem**, a nagradni fond se raspodjeljuje između dobitnih listića (4 ili više pogodaka).

---

## 📦 Struktura projekta

```
├── contracts/ # Solidity pametni ugovor
├── frontend/crypto-lotto/ # Vue 3 frontend
│ ├── components/
│ ├── contracts/ # ABI pametnog ugovora
│ ├── utils/ # Pomoćne funkcije (ethers.js)
│ ├── views/
│ ├── App.vue
│ ├── main.js
├── nft-metadata/ # JSON metapodaci za NFT (na Pinata/IPFS)
├── README.md
```

---

## 🧠 Pametni ugovor

Pametni ugovor upravlja:

- Kreiranjem i validacijom listića
- Izvlačenjem slučajnih brojeva na temelju Chainlink oraclea
- Pohranom svih prijava za pojedino kolo
- Mintanjem NFT-a pobjedniku
- Distribucijom nagradnog fonda

---

## 🖼️ NFT nagrada

- Svaki NFT ima **sliku trofeja** generiranu digitalno
- NFT metapodaci su pohranjeni na **IPFS-u** putem **Pinata** i povezani s dobitnikom kola

---

## 🧪 Testiranje

- Smart contract deployan na **Sepolia testnet**
- Frontend povezan s MetaMaskom
- Oracle testiran sa simuliranom cijenom BTC-a
- NFT mintanje testirano i verificirano na Sepolia Etherscanu

---

## 📅 Planirani razvoj

- [x] Deploy pametnog ugovora
- [x] Vue.js frontend
- [x] NFT za pobjednika
- [x] Randomness preko BTC cijene (Chainlink)
- [ ] Automatsko izvlačenje preko Chainlink Keepers
- [ ] Višekratna kola i povijest izvlačenja
- [ ] Admin sučelje (npr. ručni draw)

---

## 📬 Kontakt

Autor: Neven Nižić

Testnet: [https://sepolia.etherscan.io/address/0x543FC8F0133Bef8dde3a8a84e1d45f1459b57187]  
Smart Contract:[0x543FC8F0133Bef8dde3a8a84e1d45f1459b57187]  
NFT primjer:[bafybeieicymqdmddoqdheeq2x6ocozpsqvttai2v4m7uu7dhha4ckjbafy]

---

🏛️ **Organization**

Juraj Dobrila University of Pula  
Faculty of Informatics  
_Blockchain Applications, Academic Year 2024./2025._

**Mentor:** [Nikola Tanković](https://fipu.unipu.hr/fipu/nikola.tankovic)  
📧 nikola.tankovic@unipu.hr

---
