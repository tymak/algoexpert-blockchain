pragma solidity >=0.4.22 <=0.8.17;

contract GridMaker {
    function make2DIntGrid(
        uint256 rows,
        uint256 cols,
        int256 value
    ) public pure returns (int256[][] memory) {
        int256[][] memory array = new int256[][](rows);
        for (uint256 row; row < rows; row++) {
            int256[] memory nestedArray = new int256[](cols);
            for (uint256 col; col < cols; col++) {
                nestedArray[col] = value;
            }
            array[row] = nestedArray;
        }

        return array;
    }

    function make2DAddressGrid(uint256 rows, uint256 cols)
        public
        view
        returns (address[][] memory)
    {
        address[][] memory array = new address[][](rows);
        for (uint256 row; row < rows; row++) {
            address[] memory nestedArray = new address[](cols);
            for (uint256 col; col < cols; col++) {
                nestedArray[col] = msg.sender;
            }
            array[row] = nestedArray;
        }

        return array;
    }
}
