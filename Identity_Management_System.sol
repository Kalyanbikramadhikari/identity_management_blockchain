// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract identity_management{
// Creating the structure named Identity for public(one who is part of block chain)
    struct Identity{
        address user;
        string name;
        bytes32 father_name;
        bytes32 phone_number;
        bool isregistered;
    }
// Creating the structure named Identity_unhashed for owner(One who created the identity)
    struct Identity_unhashed{
        address user;
        string name;
        string father_name;
        string phone_number;
        bool isregistered;
    }
// Map address to identity
    mapping (address => Identity)  identities;
    mapping (address => Identity_unhashed) identities_unhashed;
// array of identity_list of type address
    address [] identity_list;
// modifier which checks wether the user is registered or not
    modifier onlyregisterd(){
        require(identities[msg.sender].isregistered==true && identities[msg.sender].isregistered==true,"Not_Registerd");
        _;
    }
// function to add the identity of the user
// this function takes three arguments name,father name and phone_number
    function add_identity(string memory name,string memory father_name,string memory phone_number)public{
        require(!identities[msg.sender].isregistered,"Already_Registered");
        bytes32 hashed_father_name = keccak256(abi.encodePacked(father_name));
        bytes32 hashed_phone_number = keccak256(abi.encodePacked(phone_number));
                identities[msg.sender] = Identity({
            user:msg.sender,
            name: name,
            father_name: hashed_father_name,
            phone_number: hashed_phone_number,
            isregistered: true
        });
        identities_unhashed[msg.sender] = Identity_unhashed({
            user:msg.sender,
            name:name,
            father_name:father_name,
            phone_number:phone_number,
            isregistered:true
        });
        identity_list.push(msg.sender);
    }
//function to update identity of the user
// this function also takes three aguments as add_identity() function
    function update_indentity(string memory name,string memory father_name,string memory phone_number)public{
        require(identities[msg.sender].isregistered && identities[msg.sender].isregistered==true,"Not_Registered");
        bytes32 hashed_father_name = keccak256(abi.encodePacked(father_name));
        bytes32 hashed_phone_number = keccak256(abi.encodePacked(phone_number));
        identities[msg.sender].name = name;
        identities[msg.sender].father_name = hashed_father_name;
        identities[msg.sender].phone_number = hashed_phone_number;
        identities_unhashed[msg.sender].name = name;
        identities_unhashed[msg.sender].father_name = father_name;
        identities_unhashed[msg.sender].phone_number = phone_number;     
    }
// function to check wether user is registered or not returns bool value
    function isregistered(address user)public view returns(bool){
        return identities[user].isregistered && identities_unhashed[user].isregistered;
    }
// function to get identity by users who are part of block chain
    function getIdentity_by_other(address user) public view returns (string memory, bytes32 ,bytes32) {
        Identity memory id = identities[user];
        return (id.name, id.father_name,id.phone_number);
    }

    function getIdentity_by_owner(address user) public view returns (string memory, string memory, string memory){
        require(msg.sender == user,"Sorry Invalid Owner!!!");
        Identity_unhashed memory id = identities_unhashed[user];
        return (id.name,id.father_name,id.phone_number);

    }

    function getAllIdentities(address user) public view returns (address[] memory) {
        require(identities[user].isregistered && identities_unhashed[user].isregistered, "Sorry You are not part of this chain");
        return identity_list;
    }
    // function deletes(address user) public  returns (address[] memory){
    //     if(identities[user].isregistered && identities_unhashed[user].isregistered){
    //         return identity_list;}
    //     else{
    //         delete identity_list;
    //         return identity_list;
    //     }
    // }
}

