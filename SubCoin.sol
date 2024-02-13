// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;


// the contract allows only its creator to mint new coins
// anyone can send this coin to each other without the need to register, all they need is an ethereum addresses

contract Coin {
    address minter;
    mapping (address => uint) balances;
}