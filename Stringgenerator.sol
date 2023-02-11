pragma solidity >=0.4.22 <=0.8.17;

contract StringGenerator {
    bytes x;
    mapping(address => bool) hasAddedCharacter;

    function addCharacter(string memory character) public {
        require(
            hasAddedCharacter[msg.sender] == false,
            "address has already added a character"
        );
        require(x.length < 5, "already 5 characters");

        bytes memory passedString = bytes(character);
        require(
            passedString.length == 1,
            "character argument must be a single character"
        );
        hasAddedCharacter[msg.sender] = true;
        x.push(passedString[0]);
    }

    function getString() public view returns (string memory) {
        return string(x);
    }
}
