pragma >= 0.7.5 <= 0.9.5;


contract Mycontract {

    event submitTransactions(address _sender, uint _txIndex, address _to,uint _value, bytes _data);
    event confirmTransactions(uint _txIndex, address _owner);
    event executedTransaction(uint _txindex, address _owner);

    mapping(address=>bool) public IsOwner;

    // store owners
    address[] public owners;
    
    // number of confirmation required for a transaction to be accepted
    uint public numConfirmationsRequired;





    /* 
    
    struct transaction that 
    store the address, 
    value ==> amount of ether for address
    byte ==> when we call another smartcontract by sending the data in bytecode
     isConfirmed ==> when owner approve the transaction, its store the approval status
    */
   
    

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
       mapping(address=>bool) isConfirmed;
       uint numCofirmations;


    }

    // store the transaction list
    Transaction[] public transactions;

    // initialised the state variable

    constructor (address[] memory _owners, uint _numConfirmations) public {
        require(_owners.length > 0, "owners array is empty");
        require(_numConfirmations >0, "numConfirmations is 0");
  

        for (uint i=0;i<_owners.length;i++){
            address owner = _owners[i];
            

            // check owner is not empty
            require(owner!=address(0), "not valid user");

            // check owner is unique
            require(!IsOwner[owner], "owner not found");

            IsOwner[owner] = true;
            owners.push(owner);
           
        }

        numConfirmations = _numConfirmations;

    }

    function () payable external {
        emit Deposit(msg.sender. msg.value,address(this).balance);
    }

    modifier onlyOwner {
        require(IsOwner(msg.sender), "not authorised for proposal");
        _;
    }




    // here submiting  proposal for withdrawl 
    function submitTransaction(address _to,uint _value, bytes memory _data ) public onlyOwner{

        uint txIndex = transactions.length;

        // create transaction
        transactions.push(Transaction({
            to :_to,
            value : _value,
            data : _data,
            executed : false,
            isConfirmed:false,
            numCofirmations:0
            

        }));

        emit submitTransactions(msg.sender, txIndex, _to, _value,_data);


    }

    modifier txExist(uint _txINdex){
        require(_txINdex > transaction.length, "not exist");
        _;

    }

    modifier notExecuted(uint _txIndex) {
        require(!transactions[_txIndex].executed, " transaction already executed");
        _;
    }

    modifier notConfirmed(uint _txINdex){
        require(!transactions[_txINdex].isConfirmed[msg.sender], "not confirmed");
        _;
    }




    function confirmTransaction(uint _txIndex) public onlyOwner txExist(_txIndex) notExecuted(_txIndex) notConfirmed(_txINdex){

        Transaction storage transaction = transactions[_txindex];
        transactions.isConfirmed[msg.sender] = true;
        transaction.numCofirmations+=1;

        emit confirmTransactions(_txIndex, msg.sender);





    } 


    function executeTransaction(uint _txIndex) public onlyOwner txExist(_txIndex) notExecuted(_txIndex){
        Transaction storage transaction = transactions[_txIndex];
   
        require(transaction.numCofirmations >= numConfirmationsRequired, "cannot execute transactions");
        transaction.executed = true;

        (bool success, ) = transaction.to.call.value(transaction.value)(transaction.data);
        require(success, "tx failed");

        emit executedTransaction(msg.sender, _txIndex)
    };
    function revokeConfirmation();


}