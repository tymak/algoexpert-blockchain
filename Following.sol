pragma solidity >=0.4.22 <=0.8.17;

contract Following {
    mapping(address => address[]) following;

    function follow(address toFollow) public {
        require(
            following[msg.sender].length < 3,
            "already following 3 address"
        );
        require(toFollow != msg.sender, "cannot follown own address");
        following[msg.sender].push(toFollow);
    }

    function getFollowing(address adr) public view returns (address[] memory) {
        return following[adr];
    }

    function clearFollowing() public {
        delete following[msg.sender];
    }
}
