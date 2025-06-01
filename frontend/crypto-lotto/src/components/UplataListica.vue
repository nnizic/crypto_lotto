<template>
  <div>
    <h2>Uplati listić</h2>
    <input
      v-for="(br, i) in brojevi"
      :key="i"
      type="number"
      min="1"
      max="39"
      v-model.number="brojevi[i]"
    />
    <button @click="uplati">Uplati (0.01 ETH)</button>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { ethers } from "ethers";
import { getLottoContract } from "../utils/contract";

const brojevi = ref(Array(7).fill(1));

async function uplati() {
  try {
    const contract = await getLottoContract();
    const tx = await contract.uplatiListic(brojevi.value, {
      value: ethers.utils.parseEther("0.01"),
    });
    await tx.wait();
    alert("Uplata uspješna!");
  } catch (err) {
    console.error(err);
    alert("Došlo je do pogreške pri uplati.");
  }
}
</script>
