pragma solidity >=0.7.5 <=0.8.7;

contract ERC20 {
    event TrasferToken(address _sender, address _Reciever, uint256 amount);

    string public tokeName;
    string public tokenSymbol;

    uint256 public totalSupply;
    uint256 public circulatedSupply;

    mapping(address => uint256) public balances;

    constructor(
        string memory _tokeName,
        string memory _tokenSymbol,
        uint256 _totalSupply
    ) {
        tokenSymbol = _tokeName;
        tokenSymbol = _tokenSymbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = totalSupply;
    }

    function transfer(address reciever, uint256 amount) external {
        require(amount <= balances[msg.sender], "not sufficient amount");

        balances[reciever] += amount;
        balances[msg.sender] -= amount;
        emit TrasferToken(msg.sender, reciever, amount);
    }

    function balanceOf(address _addr) external views returns (uint256) {
        return balances[_addr];
    }
}
