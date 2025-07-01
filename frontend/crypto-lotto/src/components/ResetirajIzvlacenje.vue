
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
import { getLottoContract, isAdmin } from "../utils/contract";

const message = ref("");
const loading = ref(false);

async function resetDraw() {
  if (!window.ethereum) {
    message.value = "MetaMask nije pronađen.";
    return;
  }

  try {
    loading.value = true;
    message.value = "";

    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const userAddress = await signer.getAddress();

    const admin = await isAdmin(userAddress);
    if (!admin) {
      message.value = "Niste ovlašteni za resetiranje izvlačenja.";
      return;
    }

    const contract = getLottoContract();

    const tx = await contract.resetirajIzvlacenje();
    await tx.wait();

    message.value = "Uspješno resetirano izvlačenje!";
  } catch (err) {
    console.error(err);
    if (err?.reason?.includes("Jos nije izvuceno")) {
      message.value = "Još nije izvršeno izvlačenje, nema što resetirati.";
    } else {
      message.value = "Greška pri resetiranju izvlačenja.";
    }
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

