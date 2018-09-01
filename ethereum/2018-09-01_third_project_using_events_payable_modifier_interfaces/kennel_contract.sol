pragma solidity ^ 0.4.24;

import "./DogContract.sol";

contract BankInterface {
    function deposit() payable;
    function getBalance() view returns(uint);
}


contract Kennel is DogContract{
    
    modifier costs(uint value) {
        require(msg.value >= value);
            _;
    }
    
    address externalAddress = 0xa36c60652b04ec2c04221eab0401fb91132f7a06;
    BankInterface BankContract = BankInterface(externalAddress);
    
    function transferDog(address _newOwner) payable costs (100){
        address owner = msg.sender;
        require(owner != _newOwner); // prevents transfer to self
        uint dogId = ownerToDog[owner]; //using mapping (ownerToDog) from DogContract.sol
        delete(ownerToDog[owner]);
        ownerToDog[_newOwner] = dogId;
        BankContract.deposit.value(msg.value)();
    }
    
    function getBankBalance() view returns (uint) {
        return BankContract.getBalance();
    }
    
    function addKennelDog(string _name, uint _age){
        addDog(_name, _age);
    }
}