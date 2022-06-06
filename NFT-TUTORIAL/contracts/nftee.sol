pragma solidity ^0.8.0;

// Import the openzepplin contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Mynft is ERC721 {
    constructor() ERC721("BondWeapon", "OO7") {
        _mint(msg.sender, 1);
    }
}

// nft contract address ==>deployed contract addresss 0x0a338425cECA692188769D1929396bDC23f9712e