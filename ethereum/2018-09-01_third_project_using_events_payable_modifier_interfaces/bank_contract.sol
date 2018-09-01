pragma solidity ^ 0.4.24;

contract BanckContract {
    uint balance;
    
    function deposit() payable {
        balance += msg.value;
    }
    
    function getBalance() view returns(uint) {
        return balance;
    }
}