// 0x543FC8F0133Bef8dde3a8a84e1d45f1459b57187
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

interface ILottoNFT {
    function mintWinnerNFT(address to) external;
}

contract CryptoLotto {
    address public owner;
    ILottoNFT public nftContract;
    AggregatorV3Interface internal priceFeed;

    address[] public igraci;
    mapping(address => uint8[7]) public listici;

    uint8[7] public dobitniBrojevi;
    bool public izvuceno;

    constructor(address _nftAddress, address _priceFeed) {
        owner = msg.sender;
        nftContract = ILottoNFT(_nftAddress);
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Nisi vlasnik.");
        _;
    }

    function uplatiListic(uint8[7] calldata brojevi) external payable {
        require(msg.value == 0.01 ether, "Uplata mora biti 0.01 ETH");
        require(!izvuceno, "Izvlacenje vec obavljeno");
        igraci.push(msg.sender);
        listici[msg.sender] = brojevi;
    }

    function btcUsdPriceFeed() external view returns (address) {
    return address(priceFeed);
}


    function izvuci() external onlyOwner {
        require(!izvuceno, "Vec izvuceno");
        (
            , 
            int256 btcCijena,
            ,
            ,
            
        ) = priceFeed.latestRoundData();

        uint256 btc = uint256(uint256(btcCijena) % 1000); // zadnje 3 decimale

        for (uint8 i = 0; i < 7; i++) {
            // pseudorandom broj između 1 i 39
            dobitniBrojevi[i] = uint8((uint256(keccak256(abi.encodePacked(btc, i))) % 39) + 1);
        }

        izvuceno = true;

        // pronađi pobjednika
        address najbolji;
        uint256 najvisePogodaka = 0;

        for (uint i = 0; i < igraci.length; i++) {
            address igrac = igraci[i];
            uint8 pogodaka = prebrojiPogotke(listici[igrac]);

            if (pogodaka >= 4 && pogodaka > najvisePogodaka) {
                najvisePogodaka = pogodaka;
                najbolji = igrac;
            }
        }

        if (najvisePogodaka >= 4) {
            nftContract.mintWinnerNFT(najbolji);
        }
    }

    function prebrojiPogotke(uint8[7] memory korisnik) internal view returns (uint8) {
        uint8 pogodaka = 0;
        for (uint8 i = 0; i < 7; i++) {
            for (uint8 j = 0; j < 7; j++) {
                if (korisnik[i] == dobitniBrojevi[j]) {
                    pogodaka++;
                    break;
                }
            }
        }
        return pogodaka;
    }

    function dohvatiDobitneBrojeve() external view returns (uint8[7] memory) {
        return dobitniBrojevi;
    }

    function brojIgraca() external view returns (uint) {
        return igraci.length;
    }
    function resetirajIzvlacenje() external onlyOwner {
    require(izvuceno, "Jos nije izvuceno, nema sta resetirati");
    izvuceno = false;

    // brisanje liste dobitnih brojeva
    for (uint8 i = 0; i < 7; i++) {
        dobitniBrojevi[i] = 0;
    }

    // brisanje igrača i listića
    delete igraci;
    // mapping??
}

}
