// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// inhereting the Erc20 token
contract myToken is ERC20 {
    constructor(string _name, string _symbol) ERC20(_name, _symbol) {
        // minting token 1000 that will send to msg.sender
        _mint(msg.sender, 1000 * 10**18);
    }
}
