// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract identity_management{

    struct Identity{
        address user;
        string name;
        bytes32 father_name;
        bytes32 phone_number;
        bool isregistered;
    }

    struct Identity_unhashed{
        address user;
        string name;
        string father_name;
        string phone_number;
        bool isregistered;
    }

    mapping (address => Identity)  identities;
    mapping (address => Identity_unhashed) identities_unhashed;

    address [] identity_list;

    modifier onlyregisterd(){
        require(identities[msg.sender].isregistered==true && identities[msg.sender].isregistered==true,"Not_Registerd");
        _;
    }

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
}
