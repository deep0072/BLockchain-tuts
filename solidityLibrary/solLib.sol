pragma solidity >=0.7.5 <=0.9.5;

library findMax {
    function find_max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }
}

contract MyContract {
    function getMax(uint256 x, uint256 y) external pure returns (uint256) {
        return findMax.find_max(x, y);
    }
}

library arrayLIB {
    function getArray(uint256[] storage arr, uint256 x)
        internal
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }

        revert("not found");
    }
}

contract arrayOPS {
    uint256[] public arr = [3, 5, 6];

    function testfind() external view returns (uint256) {
        return arrayLIB.getArray(arr, 6);
    }
}
