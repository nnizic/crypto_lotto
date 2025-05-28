//0x7ddab6E8a437bef0cCd2b63A3553b1c68559ac6b
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LottoNFT is ERC721URIStorage, Ownable {
    uint256 public tokenIdCounter;
    string public constant baseTokenURI = "ipfs://bafkreifi2gcphknhnzjoongq6pfrykurviqwxi4oivrplrdc2zadwz3lwe";

    constructor() ERC721("CryptoLottoWinner", "CLW") Ownable(msg.sender) {}

    function mintWinnerNFT(address to) external onlyOwner {
        _safeMint(to, tokenIdCounter);
        _setTokenURI(tokenIdCounter, baseTokenURI);
        tokenIdCounter++;
    }
}

