// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
import "./IERC20.sol";

contract Faucet {
    // 设定每次能领取代币数量（默认为100，不是一百枚，因为代币有小数位数）
    uint256 public amountAllowed = 100;
    // 记录发放的ERC20代币合约地址
    address public tokenContract;
    // 记录领取过代币的地址
    mapping(address => bool) public requestedAddress;

    // 记录了每次领取代币的地址和数量，在requestTokens()函数被调用时释放
    event SendToken(address indexed Receiver, uint256 indexed Amount);
    // 初始化tokenContract状态变量，确定发放的ERC20代币地址
    constructor(address _tokenContract) {
        tokenContract = _tokenContract;
    }

    // 用户调用它可以领取ERC20代币
    function reuqestTokens() external {
        require(!requestedAddress[msg.sender], "Can't Request Multiple Times!");
        IERC20 token = IERC20(tokenContract);
        require(
            token.balanceOf(address(this)) >= amountAllowed,
            "Faucet Empty!"
        );
        token.transfer(msg.sender, amountAllowed);  //  发送token
        requestedAddress[msg.sender] = true;    //  记录领取地址
        emit SendToken(msg.sender,amountAllowed);
    }
}
