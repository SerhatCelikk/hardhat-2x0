// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./Token.sol";
import "hardhat/console.sol";

contract Lock {
    SRTToken Token;
    uint256 public lockerCount;
    uint256 public totalLocked;
    mapping(address => uint256) public lockers;
    mapping(address => uint256) public deadLine;

    constructor(address tokenAddress) {
        Token = SRTToken(tokenAddress);
    }

    function lockTokens(uint256 amount, uint256 time) external {
        require(amount > 0, "Token amount must be bigger than 0.");
        require(time > 0, "Token amount must be bigger than 0.");

        //   require(Token.balanceOf(msg.sender)>=amount,"Insufficent funds");
        //   require(Token.allowance(msg.sender, address(this))>=amount,"Insufficent allowance");
        if (!(lockers[msg.sender] > 0)) lockerCount++;
        totalLocked += amount;
        lockers[msg.sender] += amount;
        deadLine[msg.sender]= block.timestamp + time;

        bool ok = Token.transferFrom(msg.sender, address(this), amount);
        require(ok, "Transfer Failed");
    }

    function withdrawTokens() external {
        require(lockers[msg.sender] > 0, "Not enough token.");
        require(block.timestamp>= deadLine[msg.sender],"Deadline is not over");
        console.log("withdraw function running");
        uint256 amount = lockers[msg.sender];
        delete (lockers[msg.sender]);
        delete(deadLine[msg.sender]);
        totalLocked -= amount;
        lockerCount--;
        require(Token.transfer(msg.sender, amount), "Transfer Failed");
    }
}
