// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.7;

contract Crud {
    struct User {
        uint id;
        string name;
    }

    mapping(uint => User) public users; // Mapping for O(1) access
    uint public nextId = 0;

    event UserCreated(uint id, string name); // Event for user creation

    function create(string memory name) public {
        users[nextId] = User(nextId, name);
        emit UserCreated(nextId, name); // Emit event
        nextId++;
    }

    function read(uint id) public view returns (uint, string memory) {
        require(id < nextId, "User not found"); // Check if user exists
        User memory user = users[id];
        return (user.id, user.name);
    }
}