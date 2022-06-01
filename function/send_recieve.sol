pragma solidity >=0.7.5 <=0.9.5;

contract sendEther {
    constructor() payable {}

    receive() external payable {}

    function trasferViaTransfer(address payable _to) external payable {
        _to.transfer(456);
    }

    function trasferViaSendr(address payable _to) external payable {
        bool sent = _to.send(56);
        require(sent, "sen failed");
    }

    function trasferViaCall(address payable _to) external payable {
        (bool sent, ) = _to.call{value: 12}("");
        require(sent, "sent failed");
    }
}

contract recieveEth {
    event Log(uint256 amount, uint256 gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
