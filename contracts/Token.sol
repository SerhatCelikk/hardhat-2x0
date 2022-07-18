// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SRTToken is ERC20 {
    constructor() ERC20("Serhat Token","SRT") {
        _mint(msg.sender, 2000000* 10 ** decimals());
    }
}