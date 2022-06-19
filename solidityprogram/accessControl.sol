pragma solidity >=0.7.5 <=0.9.5;

contract AccessControl {
    event GrantRole(bytes32 indexed role, address indexed adrr);
    event InvokeROle(bytes32 indexed role, address indexed adrr);

    // here user role is in bytes 32 to save the gas fees
    mapping(bytes32 => mapping(address => bool)) public roles;

    // now create user role

    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42

    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));
    //0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96

    modifier adminPermission(bytes32 role) {
        require(roles[role][msg.sender], "not authorised");
        _;
    }

    // create constructor
    // here we are telling the contract that admin is msg.sender user is ADMIN
    constructor() {
        _grantRole(ADMIN, msg.sender);
    }

    function _grantRole(bytes32 role, address _Addr) internal {
        roles[role][_Addr] = true;
        emit GrantRole(role, _Addr);
    }

    function grantRole(bytes32 _role, address _Addr)
        public
        adminPermission(ADMIN)
    {
        _grantRole(_role, _Addr);
    }

    function invokeRole(bytes32 _role, address _Addr)
        public
        adminPermission(ADMIN)
    {
        roles[_role][_Addr] = false;
        emit InvokeROle(_role, _Addr);
    }
}
