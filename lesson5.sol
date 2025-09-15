// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract Lesson5 {
    function mintSelector() external pure returns (bytes4 mSelector) {
        return bytes4(keccak256("mint(address)"));
    }

    event Log(address _address, uint _uint);
    function transfer(
        address recipient,
        uint amount
    ) external returns (bytes4 mSelector) {
        emit Log(recipient, amount);
        return bytes4(keccak256("transfer(address,uint256)"));
    }
}
