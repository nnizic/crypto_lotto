<template>
  <div>
    <h2>Moji NFT-ovi 🎖️</h2>
    <div v-if="nfts.length === 0">Nemate osvojenih NFT-ova.</div>
    <ul>
      <li v-for="id in nfts" :key="id">
        Token ID: {{ id }} – URI:
        <a :href="getIpfsLink(id)" target="_blank">{{ getIpfsLink(id) }}</a>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from "vue";
import { getLottoNFTContract } from "../utils/LottoNFT";

const props = defineProps({
  userAddress: String,
});

const nfts = ref([]);

function getIpfsLink(id) {
  return `https://ipfs.io/ipfs/bafkreifi2gcphknhnzjoongq6pfrykurviqwxi4oivrplrdc2zadwz3lwe`; // adresa NFTa
}

async function loadNFTs() {
  if (!props.userAddress) return;
  const contract = getLottoNFTContract();
  const tokenIds = await contract.getNFTsByOwner(props.userAddress);
  nfts.value = tokenIds.map((id) => Number(id));
}

onMounted(loadNFTs);
watch(() => props.userAddress, loadNFTs);
</script>
