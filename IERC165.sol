// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
interface IERC165 { 
    // 如果合约实现了查询的interfaceId,则返回true
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
