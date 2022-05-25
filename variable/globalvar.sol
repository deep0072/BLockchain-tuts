pragma solidity >=0.7.0 <0.9.0;

contract Mycontract {
    function GlobalVar()
        external
        view
        returns (
            address,
            uint256,
            uint256
        )
    {
        address addr = msg.sender;
        uint256 timestamp = block.timestamp;
        uint256 blocknum = block.number;

        return (addr, timestamp, blocknum);
    }
}
