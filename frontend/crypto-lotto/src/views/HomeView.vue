<template>
  <div id="app">
    <h1>CRYPTO LOTTO</h1>

    <connect-wallet @wallet-connected="setAccount" />

    <div v-if="account">
      <p>Prijavljeni račun: {{ account }}</p>

      <div v-if="isAdmin">
        <resetiraj-izvlacenje />
        <izvuci-brojevi />
      </div>

      <div v-else>
        <uplata-listica />
        <moji-nftovi :user-address="account" />
      </div>

      <dobitni-brojevi />
      <broj-igraca />
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import ConnectWallet from "../components/ConnectWallet.vue";
import UplataListica from "../components/UplataListica.vue";
import IzvuciBrojeve from "../components/IzvuciBrojevi.vue";
import DobitniBrojevi from "../components/DobitniBrojevi.vue";
import BrojIgraca from "../components/BrojIgraca.vue";
import ResetirajIzvlacenje from "../components/ResetirajIzvlacenje.vue";
import MojiNFTovi from "../components/MojiNFTovi.vue";
import { isAdmin as checkIsAdmin } from "../utils/contract";

const account = ref(null);
const isAdmin = ref(false);

// prima event iz ConnectWallet
async function setAccount({ address, isAdmin: adminStatus }) {
  account.value = address;
  isAdmin.value = adminStatus;
}
</script>

<style>
#app {
  text-align: center;
  padding: 2rem;
  font-family: "Segoe UI", sans-serif;
}
</style>

