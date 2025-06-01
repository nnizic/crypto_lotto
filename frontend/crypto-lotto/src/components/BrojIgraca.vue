<template>
  <div>
    <h2>Ukupno igrača</h2>
    <button @click="dohvati" :disabled="loading">
      {{ loading ? "Učitavanje..." : "Osvježi" }}
    </button>
    <p v-if="broj !== null">Igrača: {{ broj }}</p>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { getLottoContract } from "../utils/contract";

const broj = ref(null);
const loading = ref(false);

async function dohvati() {
  loading.value = true;
  try {
    const contract = await getLottoContract();
    const result = await contract.brojIgraca();
    broj.value = Number(result);
  } catch (err) {
    console.error("Greška pri dohvaćanju broja igrača:", err);
    alert("Greška pri dohvaćanju broja igrača.");
  } finally {
    loading.value = false;
  }
}
</script>
