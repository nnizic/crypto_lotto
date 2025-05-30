<template>
  <div id="app">
    <h1>CRYPTO LOTTO</h1>
    <connect-wallet />
    <resetiraj-izvlacenje />
    <uplata-listica />
    <izvuci-brojeve />
    <dobitni-brojevi />
    <broj-igraca />
  </div>
</template>

<script setup>
import ConnectWallet from "./components/ConnectWallet.vue";
import UplataListica from "./components/UplataListica.vue";
import IzvuciBrojeve from "./components/IzvuciBrojeve.vue";
import DobitniBrojevi from "./components/DobitniBrojevi.vue";
import BrojIgraca from "./components/BrojIgraca.vue";
import ResetirajIzvlacenje from "./components/ResetirajIzvlacenje.vue";
</script>
<style>
#app {
  text-align: center;
  padding: 2rem;
  font-family: "Segoe UI", sans-serif;
}
</style>
