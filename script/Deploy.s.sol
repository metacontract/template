// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCDevKit} from "mc/devkit/MCDevKit.sol";
import {MCScript} from "mc/devkit/MCScript.sol";
import {DeployLib} from "./DeployLib.sol";

contract DeployScript is MCScript {
    using DeployLib for MCDevKit;

    function run() public {
        vm.startBroadcast(getPrivateKey("DEPLOYER_PRIV_KEY"));

        mc.deployCounter(1);

        vm.stopBroadcast();

    }
}
