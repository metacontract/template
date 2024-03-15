// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Increment} from "bundle/counter/functions/Increment.sol";
import {Initialize} from "bundle/counter/functions/Initialize.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {CounterFacade} from "bundle/counter/interfaces/CounterFacade.sol";
import {MCDevKit} from "mc/devkit/MCDevKit.sol";

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
