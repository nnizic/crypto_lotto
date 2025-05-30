<template>
  <div>
    <h2>Izvuci dobitne brojeve</h2>
    <button @click="izvuci">Pokreni izvlačenje</button>
  </div>
</template>

<script setup>
import { getLottoContract } from "../utils/contract";

async function izvuci() {
  try {
    const contract = await getLottoContract();
    const tx = await contract.izvuci();
    await tx.wait();
    alert("Izvlačenje uspješno!");
  } catch (err) {
    console.error(err);
    alert(
      "Greška prilikom izvlačenja: samo vlasnik može pozvati ovu funkciju."
    );
  }
}
</script>
