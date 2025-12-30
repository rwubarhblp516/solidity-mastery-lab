// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {HelloWeb3} from "../src/01_HelloWeb3.sol";

contract DeployHelloWeb3 is Script {
    function run() external {
        // 从环境变量或交互式输入中获取私钥
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // 开启广播（这之后的交易都会记录到 broadcast 文件夹）
        vm.startBroadcast(deployerPrivateKey);
        // 初始化合约
        new HelloWeb3();
        // 停止广播
        vm.stopBroadcast();
    }
}