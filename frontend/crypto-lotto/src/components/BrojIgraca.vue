<template>
  <div>
    <h2>Ukupno igrača</h2>
    <button @click="dohvati">Osvježi</button>
    <p>{{ broj }}</p>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { getLottoContract } from '../utils/contract'

const broj = ref(0)

async function dohvati() {
  try {
    const contract = await getLottoContract()
    broj.value = Number(await contract.brojIgraca())
  } catch (err) {
    console.error(err)
    alert("Greška pri dohvaćanju broja igrača.")
  }
}
</script>

