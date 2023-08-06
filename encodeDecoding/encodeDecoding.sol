// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract EncodDecode {
    function encodeString() public pure returns (bytes memory) {
        return abi.encode("deepak encoded", "ok"); // convert string to bytes  but with giving extrapadding
    }

    function encodePackedString() public pure returns (bytes memory) {
        return abi.encodePacked("deeoak encoded packed"); // convert string to bytes  but without giving extrapadding
    }

    function encodeBytesString() public pure returns (bytes memory) {
        return bytes("Deepak bytes encoded"); // convert string to bytes  but without giving extrapadding
    }

    function decodeEncodeString() public pure returns (string memory) {
        return string(encodeString());
    }

    function decodeEncodedPAckedString() public pure returns (string memory) {
        return string(encodePackedString());
    }

    function decodeBytesString() public pure returns (string memory) {
        return string(encodeBytesString());
    }

    function multiEncode() public pure returns (bytes memory) {
        return (abi.encode(" hi", "deepak"));
        // output  0x0000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000032068690000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000664656570616b0000000000000000000000000000000000000000000000000000
    }

    function multiDecode() public pure returns (string memory, string memory) {
        // here decode wi;; take concatenated bytes and convert back  it into splited string lik "hi" "Deepak"
        (string memory one, string memory two) = abi.decode(
            multiEncode(),
            (string, string)
        );
        return (one, two);
    }
}
