// SPDX-License-Identifier: MIT
pragma solidity 0.8.33; // 锁定 2025 年 12 月最新的编译器版本

contract ValueTypes {
    // --- 1. 基础数值类型 ---
    bool public _bool = true;
    
    // uint256 是 EVM 的原生字长（32字节），处理起来最快
    uint256 public _uint = 2026; 
    int256 public _int = -1;

    // --- 2. 地址类型 ---
    // address 占用 20 字节
    address public _address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // payable 地址才能接收 ETH 转账
    address payable public _addressPayable = payable(_address);

    // --- 3. 字节类型 (Fixed-size byte arrays) ---
    // bytes32 是最省 Gas 的存储方式，适合存储短字符串或哈希
    bytes32 public _byte32 = "Hello 2026";

    // --- 4. 职业级优化：常量与不可变量 ---
    
    // constant: 必须在声明时赋值，不占存储槽，Gas 成本极低！
    // 0.8.33 修复了获取 constant 变量时的潜在编译器 Bug
    uint256 public constant MAX_SUPPLY = 10000;

    // immutable: 可以在构造函数中赋值一次，之后不可更改
    address public immutable DEPLOYER;

    constructor() {
        DEPLOYER = msg.sender; // 记录部署者地址
    }

    // 读取地址余额的函数
    function getBalance() public view returns (uint256) {
        return _address.balance;
    }
}