<template>
  <div>
    <h2>Dobitni brojevi</h2>
    <button @click="dohvatiBrojeve">Osvježi</button>
    <div v-if="brojevi.length">
      <p>{{ brojevi.join(', ') }}</p>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { getLottoContract } from '../utils/contract';

const brojevi = ref([]);

async function dohvatiBrojeve() {
  try {
    const contract = await getLottoContract();
    const result = await contract.dohvatiDobitneBrojeve();
    brojevi.value = result.map((b) => Number(b));
  } catch (err) {
    console.error(err);
    alert('Greška pri dohvaćanju brojeva.');
  }
}
</script>
