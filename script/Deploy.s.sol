// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "mc/devkit/MCDevKit.sol";
import "mc/devkit/MCScript.sol";
import "./DeployLib.sol";

contract DeployScript is MCScript {
    using DeployLib for MCDevKit;
    
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        mc.deployCounter();

        vm.stopBroadcast();

    }
}
