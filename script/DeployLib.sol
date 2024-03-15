// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "bundle/counter/functions/Increment.sol";
import "bundle/counter/functions/Initialize.sol";
import "bundle/counter/functions/SetNumber.sol";
import "bundle/counter/interfaces/CounterFacade.sol";
import "mc/devkit/MCDevKit.sol";

library DeployLib {
    function deployCounter(MCDevKit storage mc) public {
        mc.init("Counter")
            .use("Increment", Increment.increment.selector, address(new Increment()))
            .use("Initialize", Initialize.initialize.selector, address(new Initialize()))
            .use("SetNumber", SetNumber.setNumber.selector, address(new SetNumber()))
            .set("Counter", address(new CounterFacade()))
            .deploy(abi.encodeCall(Initialize.initialize, 1))
            .toProxyAddress();
    }
}