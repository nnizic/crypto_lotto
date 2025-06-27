0x08688c7753eA59391A46aB3209139B995a9B3c67
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LottoNFT is ERC721URIStorage, Ownable {
    uint256 public tokenIdCounter;
    string public constant baseTokenURI = "ipfs://bafkreifi2gcphknhnzjoongq6pfrykurviqwxi4oivrplrdc2zadwz3lwe";

    mapping(address => uint256[]) private _ownedTokens;

    constructor() ERC721("CryptoLottoWinner", "CLW") Ownable(msg.sender) {}

    function mintWinnerNFT(address to) external onlyOwner {
        uint256 newTokenId = tokenIdCounter;
        _safeMint(to, newTokenId);
        _setTokenURI(newTokenId, baseTokenURI);
        _ownedTokens[to].push(newTokenId); // pamti vlasništvo
        tokenIdCounter++;
    }

    // Pogledaj sve tokene koje korisnik posjeduje
    function getNFTsByOwner(address owner) external view returns (uint256[] memory) {
        return _ownedTokens[owner];
    }

    // Samo potrebni override-i
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}


