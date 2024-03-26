// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCDevKit} from "mc/devkit/MCDevKit.sol";
// Bundle interface
import {CounterFacade} from "bundle/counter/interfaces/CounterFacade.sol";
// Functions
import {Increment} from "bundle/counter/functions/Increment.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {Initialize} from "bundle/counter/functions/protected/Initialize.sol";

library DeployLib {
    function bundleName() internal returns(string memory) {
        return "Counter";
    }

    function deployCounter(MCDevKit storage mc, uint256 initialNumber) internal returns(MCDevKit storage) {
        mc.init(bundleName());
        mc.use("Increment", Increment.increment.selector, address(new Increment()));
        mc.use("SetNumber", SetNumber.setNumber.selector, address(new SetNumber()));
        mc.use("Initialize", Initialize.initialize.selector, address(new Initialize()));
        mc.deploy(abi.encodeCall(Initialize.initialize, initialNumber));
        return mc;
    }
}
