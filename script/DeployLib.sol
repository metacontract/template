// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Increment} from "bundle/counter/functions/Increment.sol";
import {Initialize} from "bundle/counter/functions/Initialize.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {CounterFacade} from "bundle/counter/interfaces/CounterFacade.sol";
import {MCDevKit} from "mc/devkit/MCDevKit.sol";

library DeployLib {
    function bundleName() internal returns(string memory) {
        return "Counter";
    }

    function deployCounter(MCDevKit storage mc, uint256 initialNumber) internal returns(MCDevKit storage) {
        mc.init(bundleName());
        mc.use("Increment", Increment.increment.selector, address(new Increment()));
        mc.use("Initialize", Initialize.initialize.selector, address(new Initialize()));
        mc.use("SetNumber", SetNumber.setNumber.selector, address(new SetNumber()));
        mc.deploy(abi.encodeCall(Initialize.initialize, initialNumber));
        return mc;
    }
}
