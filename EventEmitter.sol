pragma solidity >=0.4.22 <=0.8.17;

contract EventEmitter {
    uint8 emitCount = 1;
    event Called(address indexed sender, uint8 count);

    function count() public {
        emit Called(msg.sender, emitCount++);
    }
}
