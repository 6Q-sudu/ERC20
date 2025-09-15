// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
// 接口合约
interface IERC20 {
    /**
     *   @dev 释放条件：当value 单位的货币从账户 from 转账到另一个账户 to时
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 释放条件：当 value 单位的货币从账户 owner 授权给另一个账户spender 时
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    // 返回代币总供给
    function totalSupply() external view returns (uint256);

    // 返回account所持有的代币数
    function balanceOf(address account) external view returns (uint256);

    // 转账 amount 单位代币，从调用者账户到另一个账户 to
    // 如果成功
    // 释放 transfer 时间
    function transfer(address to, uint256 amount) external returns (bool);

    // 返回 owner 账户授权给spender 账户的额度，默认为0
    // 当 approve 或 transferFrom 被调用时，allowance 会改变
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    // 调用者账户给spender账户授权 amount 数量代币
    // 如果成功 返回true
    // 释放 Approval 事件
    function approve(address spender, uint256 amount) external returns (bool);

    // 通过授权机制，从from账户向to账户转账amount数量代币，转账的部分会从调用者的allowance中扣除
    // 如果成功，返回true
    // 如果失败，返回false
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}
