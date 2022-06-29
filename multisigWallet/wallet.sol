pragma solidity >=0.7.5 <=0.9.5;

contract Wallet {
    event Deposit(address _Sender, uint256 _value);
    event submit(uint256 txID);
    event Exceute(uint256 _txID);
    event Approve(address _owner, uint256 _txID);
    event Revoke(address _owner, uint256 _txID);

    struct Transaction {
        address to;
        uint256 value;
        bytes data;
        bool executed;
    }

    // list of owners
    address[] public owners;

    // check unique owner
    mapping(address => bool) public Isowner;

    uint256 public requiredApproval;
    Transaction[] public transactions;

    // just to store the approved transaction
    mapping(uint256 => mapping(address => bool)) public approved;

    constructor(address[] memory _owners, uint256 _requiredApproval) {
        require(
            _requiredApproval > 0 && _requiredApproval <= _owners.length,
            "invalid required number of owners"
        );
        require(_owners.length > 0, "owners are empty");

        for (uint256 i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "invalid owner");
            require(!Isowner[owner], "owner is not unique");

            Isowner[owner] = true;
            owners.push(owner);
        }

        requiredApproval = _requiredApproval;
    }

    modifier onlyOwner() {
        require(Isowner[msg.sender], "not owner");
        _;
    }

    modifier txExist(uint256 _txID) {
        require(_txID < transactions.length, "not exist");
        _;
    }

    modifier notApproved(uint256 _txID) {
        require(!approved[_txID][msg.sender], "already approved");
        _;
    }

    modifier notExecuted(uint256 _txID) {
        require(!transactions[_txID].executed, "alread executed");
        _;
    }

    // multisig now receive the ether
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function submitTransaction(
        address _to,
        uint256 _value,
        bytes calldata _data
    ) external onlyOwner {
        transactions.push(
            Transaction({to: _to, value: _value, data: _data, executed: false})
        );

        emit submit(transactions.length - 1);
    }

    function approve(uint256 _txID)
        external
        onlyOwner
        txExist(_txID)
        notApproved(_txID)
        notExecuted(_txID)
    {
        approved[_txID][msg.sender] = true;

        emit Approve(msg.sender, _txID);
    }

    function _getApprovalCount(uint256 _txID)
        private
        view
        returns (uint256 count)
    {
        for (uint256 i = 0; i < owners.length; i++) {
            if (approved[_txID][owners[i]]) {
                count += 1;
            }
        }
    }

    function execute(uint256 _txID) external txExist(_txID) notExecuted(_txID) {
        require(
            _getApprovalCount(_txID) >= requiredApproval,
            "not required confirmations"
        );

        Transaction storage transaction = transactions[_txID];
        transaction.executed = true;
        (bool success, ) = transaction.to.call{value: transaction.value}(
            transaction.data
        );

        require(success, "failed ");
        emit Exceute(_txID);
    }

    function revoke(uint256 _txID)
        external
        onlyOwner
        txExist(_txID)
        notExecuted(_txID)
    {
        require(approved[_txID][msg.sender], "not approved");
        approved[_txID][msg.sender] = false;

        emit Revoke(msg.sender, _txID);
    }
}
