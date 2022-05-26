pragma solidity >=0.7.5 <0.9.0;

contract Loop {
    function loop(uint256 n) external pure returns (uint256) {
        uint256 s;

        for (uint256 i = 1; i < n; i++) {
            s += i;
        }
        return s;
    }
}
