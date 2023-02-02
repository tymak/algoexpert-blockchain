pragma solidity >=0.4.22 <=0.8.17;

contract Voting {
    mapping(uint8 => uint256) votes;
    mapping(address => bool) voted;

    uint8 candidateWinner = 1;
    uint256 winnerVotes = 0;

    function getVotes(uint8 number) external view returns (uint256) {
        require((number > 0 && number < 6), "invalid number");
        return votes[number];
    }

    function vote(uint8 number) external {
        require(voted[msg.sender] == false, "user alreday voted");
        require((number > 0 && number < 6), "invalid number");
        voted[msg.sender] = true;
        votes[number]++;
        if (votes[number] >= winnerVotes) {
            candidateWinner = number;
            winnerVotes = votes[number];
        }
    }

    function getCurrentWinner() external view returns (uint8) {
        return candidateWinner;
    }
}
