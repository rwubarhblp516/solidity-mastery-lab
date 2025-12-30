// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

contract ValueTypes {
    // 布尔类型变量
    bool public _bool = true;

    // 整形
    uint256 public _uint = 2025;
    int256 public _int = -1;

    // 地址类型变量
    address public _address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable public _addressPayable = payable(_address);

    // 字节类型变量
    bytes32 public _byte32 = "WTF"; // 固定长度字节数组极其节省 Gas

    // 使用 constant 定义不变量，变量名建议大写
    // 这种变量不占存储槽（Storage），直接嵌入字节码，极省 Gas！
    uint256 public constant MAX_SUPPLY = 10000;

    // 获取地址余额的函数
    function getBalance() public view returns (uint256) {
        return _address.balance;
    }
}