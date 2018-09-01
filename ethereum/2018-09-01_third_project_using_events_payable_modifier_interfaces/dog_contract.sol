pragma solidity ^ 0.4.24;

contract DogContract{
    
    struct Dog {
        string name;
        uint age;
    }
    
    Dog[] dogs;
    
    mapping(address => uint) ownerToDog;
    
    event addedDog(address owner, string name, uint dogId);
    
    function addDog(string _name, uint _age) internal{
        address owner = msg.sender;
        uint id = dogs.push(Dog(_name, _age));
        ownerToDog[owner] = id;
        addedDog(owner, _name, id);
    }
    
    function getDogName() returns (string) {
        address cat = msg.sender;
        uint banana = ownerToDog[cat];
        return dogs[banana-1].name;
    }
}
