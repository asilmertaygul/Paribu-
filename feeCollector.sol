// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

// Sözleşme içerisindeki değerlere atama yapıyoruz.
    constructor() {
        
        owner = msg.sender;
    }

// Sözleşme gereği toplanacak tutarın nasıl alınacağı belirleniyor.
    receive() payable external {
        
        balance += msg.value;

    }

// Biriken tutarı çekmek isteyen eğer sözleşmede atamalı bulunan adres sahibi ise çekerek hesabın azalmasını
// eğer değilse uyarı vermesini, yine hesapta çekilmek istenen tutarda az miktar varsa uyarı veren bir fonksiyon.
    function withdraw(uint amount, address payable desAddr) public {
        require(msg.sender == owner, "Attention! Only owner can withdraw...");
        require(amount <= balance, "Insufficent amount.");

        desAddr.transfer(amount);
        balance -= amount; 
    }
}
