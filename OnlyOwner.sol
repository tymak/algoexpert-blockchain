pragma solidity >=0.4.22 <=0.8.17;

contract OnlyOwner {
    address owner;
    uint8 value = 0;

    constructor() {
        owner = msg.sender;
    }

    function validate() private view {
        require(msg.sender == owner, "you are not an owner");
    }

    function add(uint8 number) external {
        validate();
        value += number;
    }

    function subtract(uint8 number) external {
        validate();
        value -= number;
    }

    function get() external view returns (uint8) {
        validate();
        return value;
    }
}
