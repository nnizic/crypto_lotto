<template>
  <div>
    <button @click="connectWallet" v-if="!account">Poveži MetaMask</button>
    <p v-else>Povezano: {{ account }}</p>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { isAdmin } from "../utils/contract";

const emit = defineEmits(["walletConnected"]);

const account = ref(null);

async function connectWallet() {
  if (window.ethereum) {
    try {
      const [addr] = await window.ethereum.request({
        method: "eth_requestAccounts",
      });
      account.value = addr;

      // provjera admin statusa
      const admin = await isAdmin(addr);
      emit("walletConnected", { address: addr, isAdmin: admin });

    } catch (err) {
      console.error("Korisnik je odbio MetaMask povezivanje", err);
    }
  } else {
    alert("MetaMask nije pronađen. Instaliraj ga.");
  }
}
</script>

