pragma solidity ^ 0.4.24;

contract Money{
    
struct Wallet{
    string owner;
    uint money;
}

Wallet[] people;

function addWallet(string _name, uint _money){
    people.push(Wallet(_name, _money));
}

function getAverageMoney() view returns(uint){
    uint totalMoney;
    for(uint i=0; i< people.length; i++){
        totalMoney =+ people[i].money;
    }
    return totalMoney/people.length;
}
}