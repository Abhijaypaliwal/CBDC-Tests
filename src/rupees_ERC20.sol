pragma solidity ^0.8.16;


import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract GLDToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("Indian Rupee", "INR") {
        _mint(msg.sender, initialSupply);
    }

    function mint(uint _quantity) public {
        _mint(msg.sender, _quantity);
    }
}

