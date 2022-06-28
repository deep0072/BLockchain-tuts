pragma >= 0.7.5 <= 0.9.5;


contract Mycontract {

    mapping(address=>bool) public IsOwner;

    // store owners
    address[] public owners;
    
    // number of confirmation required for a transaction to be accepted
    uint public numConfirmations;





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
        bool isConfirmed;

    }

    // store the transaction list
    Transaction[] public transactions;

    // initialised the state variable

    constructor (address memory _owners, uint _numConfirmations) public {
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

    modifier onlyOwner {
        require(isOwner(msg.sender), "not authorised for proposal");
        _;
    }



    function submitTransaction(address _to,uint _value, bytes memory _data ) public onlyOwner{

        uint txIndex = transactions.length;


    }
    function confirmTransaction();    
    function executeTransaction();
    function revokeConfirmation();


}