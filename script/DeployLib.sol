// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "bundle/counter/functions/Increment.sol";
import "bundle/counter/functions/Initialize.sol";
import "bundle/counter/functions/SetNumber.sol";
import "bundle/counter/interfaces/CounterFacade.sol";
import "mc/devkit/MCDevKit.sol";

import "forge-std/console.sol";

library DeployLib {
    function bundleName() public returns(string memory) {
        return "Counter";
    }

    function deployCounter(MCDevKit storage mc) public {
        mc.init(bundleName());
        mc.use("Increment", Increment.increment.selector, address(new Increment()));
        mc.use("Initialize", Initialize.initialize.selector, address(new Initialize()));
        mc.use("SetNumber", SetNumber.setNumber.selector, address(new SetNumber()));
        // mc.set("Counter", address(new CounterFacade()));
        mc.deploy(abi.encodeCall(Initialize.initialize, 1));
    }
}