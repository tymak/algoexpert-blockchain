pragma solidity >=0.4.22 <=0.8.17;

contract Balances {
    mapping(address => uint256) received;

    receive() external payable {
        received[msg.sender] += msg.value;
    }

    fallback() external payable {
        received[msg.sender] += msg.value;
    }

    function getAmountSent(address adr) external view returns (uint256) {
        return received[adr];
    }
}
