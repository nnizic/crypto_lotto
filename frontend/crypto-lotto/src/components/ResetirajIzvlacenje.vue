<template>
  <div>
    <button @click="resetDraw" :disabled="loading">
      {{ loading ? "Resetiram..." : "Resetiraj Izvlačenje" }}
    </button>
    <p v-if="message">{{ message }}</p>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { ethers } from "ethers";
import abi from "../contracts/CryptoLotto.json";

const contractAddress = "0x543FC8F0133Bef8dde3a8a84e1d45f1459b57187";
const message = ref("");
const loading = ref(false);

async function resetDraw() {
  if (!window.ethereum) {
    message.value = "MetaMask nije pronađen";
    return;
  }

  try {
    loading.value = true;
    message.value = "";

    const provider = new ethers.BrowserProvider(window.ethereum);
    const signer = await provider.getSigner();
    const contract = new ethers.Contract(contractAddress, abi, signer);

    const tx = await contract.resetirajIzvlacenje();
    await tx.wait();

    message.value = "Uspješno resetirano izvlačenje!";
  } catch (err) {
    console.error(err);
    message.value = "Greška pri resetiranju izvlačenja";
  } finally {
    loading.value = false;
  }
}
</script>

<style scoped>
button {
  padding: 0.5rem 1rem;
  font-size: 1rem;
  background-color: #e74c3c;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}
button:disabled {
  background-color: #aaa;
  cursor: not-allowed;
}
p {
  margin-top: 0.5rem;
}
</style>
