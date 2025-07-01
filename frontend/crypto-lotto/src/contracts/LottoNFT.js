import { ethers } from "ethers";
import abi from "./LottoNFT.json";

export const CONTRACT_ADDRESS = "0x08688c7753eA59391A46aB3209139B995a9B3c67";
export const CONTRACT_ABI = abi;

export async function getNFTsByOwner(provider, ownerAddress) {
  const contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, provider);
  const tokenIds = await contract.getNFTsByOwner(ownerAddress);
  return tokenIds.map(id => id.toNumber()); // pretvaranje BigNumber objekata u broj
}

