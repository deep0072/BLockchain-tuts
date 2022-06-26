pragma solidity >=0.7.5 <=0.8.7;

contract Myerc20 {
    event transferToken(address sender, address reciever, uint256 amount);
    event allowedInfo(address from, address reciever, uint256 amount);

    mapping(address => mapping(address => uint256)) allowed;

    address owner;

    string public tokenName;
    string public symbol;
    uint256 public totalSupply;
    mapping(address => uint256) balances;

    constructor(
        string memory _tokenName,
        uint256 _totalSupply,
        string memory _symbol
    ) {
        tokenName = _tokenName;
        totalSupply = _totalSupply;
        symbol = _symbol;

        owner = msg.sender;
        balances[msg.sender] += _totalSupply;
    }

    modifier OnlyAdmin(address addr) {
        require(addr == owner, " not authorised");
        _;
    }

    function blancesOf(address _addr) external view returns (uint256) {
        return balances[_addr];
    }

    function transfer(uint256 amount, address _to) external {
        require(amount <= balances[msg.sender], "not sufficient amount");

        balances[_to] += amount;
        balances[msg.sender] -= amount;
        emit transferToken(msg.sender, _to, amount);
    }

    function _mint(uint256 amount) external OnlyAdmin(msg.sender) {
        totalSupply += amount;
        balances[msg.sender] += amount;
    }

    function burn(address burner, uint256 amount) external {
        require(amount <= balances[burner], " not sufficient amount to burn");
        balances[burner] -= amount;
        totalSupply -= amount;
    }

    // check the allowed token balance
    function allowance(
        address _owner,
        address _spender,
        uint256 token
    ) external view returns (uint256) {
        return allowed[_owner][_spender];
    }

    // to approve the token to spend
    function approve(
        address _owner,
        address _spender,
        uint256 amount
    ) external OnlyAdmin(msg.sender) {
        require(
            amount <= balances[_owner],
            "not sufficient amount for allowance"
        );

        allowed[_owner][_spender] += amount;

        emit allowedInfo(_owner, _spender, amount);
    }

    // function to spend the alowed token here only spender allowed to spend the token. msg.sender is spender

    function transferFrom(
        address _from,
        address _to,
        uint256 amount
    ) external {
        require(
            amount <= allowed[_from][msg.sender] && amount <= balances[_from],
            "not sufficent amount to spend"
        );
        balances[_from] -= amount;
        allowed[_from][msg.sender] -= amount;

        emit transferToken(_from, _to, amount);
    }
}
