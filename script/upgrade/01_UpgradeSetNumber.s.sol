// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCScript, MCDevKit} from "@mc-devkit/Flattened.sol";
import {CounterUpgrader} from "./CounterUpgrader.sol";

contract UpgradeSetNumberScript is MCScript {
    function run() public startBroadcastWith("DEPLOYER_PRIV_KEY") {
        address _counter = vm.envAddress("COUNTER_PROXY_ADDR_31337");
        CounterUpgrader.upgradeSetNumber(mc, _counter);
    }
}
