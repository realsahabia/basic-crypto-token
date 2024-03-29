// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;


// the contract allows only its creator to mint new coins
// anyone can send this coin to each other without the need to register, all they need is an ethereum addresses

contract Coin {
    address minter;
    mapping (address => uint) balances;
    event Sent(address from, address to, uint amount);

    constructor(){
        minter = msg.sender;
    }

    function mint(address walletAddress, uint amount) public {
        require(msg.sender == minter);

        balances[walletAddress] += amount;
    }

    error insufficiantBalance(uint requested, uint available);

    function send(address receiver, uint amount) public{
        if (amount > balances[msg.sender]){
            revert insufficiantBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }

        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit Sent(msg.sender, receiver, amount);
    }
}