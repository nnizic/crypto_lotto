<template>
  <div class="moji-nftovi">
    <h2>Moji NFT-ovi 🏆</h2>

    <div v-if="loading">Učitavanje NFT-ova...</div>

    <div v-else-if="nfts.length === 0">
      Nemate osvojenih NFT-ova.
    </div>

    <ul v-else>
      <li v-for="id in nfts" :key="id">
        Token ID: {{ id }} – URI: 
        <a :href="getIpfsLink(id)" target="_blank">
          {{ getIpfsLink(id) }}
        </a>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import { getUserNFTs } from "../../utils/LottoNFT";

const props = defineProps({
  userAddress: {
    type: String,
    required: true,
  },
});

const nfts = ref([]);
const loading = ref(false);

// dohvaća NFT-ove za korisnika
async function fetchNFTs() {
  if (!props.userAddress) return;
  loading.value = true;
  try {
    const tokenIds = await getUserNFTs(props.userAddress);
    nfts.value = tokenIds;
  } catch (error) {
    console.error("Greška pri dohvaćanju NFT-ova:", error);
  } finally {
    loading.value = false;
  }
}

// IPFS URI helper
function getIpfsLink(tokenId) {
  // svi koriste isti base URI - ista slika NFT-a za svih
  return "https://ipfs.io/ipfs/bafkreifi2gcphknhnzjoongq6pfrykurviqwxi4oivrplrdc2zadwz3lwe";
}

// automatski dohvat kada se adresa promijeni
watch(() => props.userAddress, fetchNFTs, { immediate: true });
</script>

<style scoped>
.moji-nftovi {
  margin-top: 2rem;
  text-align: left;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}
ul {
  list-style: none;
  padding-left: 0;
}
li {
  padding: 0.5rem 0;
}
</style>

