// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract EncodDecode {
    address public s_someAddress;
    uint256 public s_someAmount;

    function transfer(address someAddress, uint256 someAmount) public {
        s_someAddress = someAddress;
        s_someAmount = someAmount; // convert string to bytes  but with giving extrapadding
    }

    function getFunctionSelectorOne() public pure returns (bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
        // output 0xa9059cbb is  function selector which is equivalent to transfer(address. uint256) (function sognature)
    }

    function callFunctionDirectly(
        address someAddress,
        uint256 amount
    ) public returns (bytes4, bool) {
        // we used encodeWithSelector()==> it takes two params first is function selector(bytes format of function name) and second is the function parameter.
        // then we call this encoded selected function with its params with the help of dot call()  function

        // abi.encodeWithSelector(getFunctionSelectorOne(), someAddress, amount) ==> this calling "transfer(address someAddress, uint256 someAmount)"
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodeWithSelector(
                getFunctionSelectorOne(),
                someAddress,
                amount
            )
        );

        return (bytes4(returnData), success);
    }

    function callFunctionDirectlyWithSig(
        address someAddress,
        uint256 amount
    ) public returns (bytes4, bool) {
        // we used encodeWithSignature()==> it takes two params first is function signature( function name with its params in string) and second is the function parameter.
        // then we call this encodeWithSignature() with its params with the help of dot call()  function

        // abi.encodeWithSignature(functionName(params1,params2), someAddress, amount) ==> this calling "transfer(address someAddress, uint256 someAmount)"
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodeWithSignature(
                "transfer(address,uint256)",
                someAddress,
                amount
            )
        );

        return (bytes4(returnData), success);
        // this is encodeWithSignature() ==> this is better than encodeWithSelector because we do not need to manual convert function sig into its bytes format
    }
}
