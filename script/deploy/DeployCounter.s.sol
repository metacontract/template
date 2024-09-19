// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCScript, MCDevKit} from "@mc-devkit/Flattened.sol";
import {CounterDeployer} from "./CounterDeployer.sol";

contract DeployCounterScript is MCScript {
    function run() public startBroadcastWith("DEPLOYER_PRIV_KEY") {
        address _counter = CounterDeployer.deployCounter(mc, 1);
        _saveAddrToEnv(_counter, "COUNTER_PROXY_ADDR_");
    }
}
