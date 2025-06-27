// utils/contract.js
import { ethers } from "ethers";
import {
  CONTRACT_ADDRESS as LOTTO_ADDRESS,
  CONTRACT_ABI as LOTTO_ABI,
} from "../contracts/CryptoLotto";
import {
  CONTRACT_ADDRESS as NFT_ADDRESS,
  CONTRACT_ABI as NFT_ABI,
} from "../contracts/LottoNFT";

export function getLottoContract() {
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  return new ethers.Contract(LOTTO_ADDRESS, LOTTO_ABI, signer);
}

export function getNFTContract() {
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  return new ethers.Contract(NFT_ADDRESS, NFT_ABI, signer);
}
