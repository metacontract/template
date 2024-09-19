// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCDevKit} from "@mc-devkit/Flattened.sol";
// Interface
import {CounterFacade} from "bundle/counter/interfaces/CounterFacade.sol";
// Functions
import {Initialize} from "bundle/counter/functions/initializer/Initialize.sol";
import {GetNumber} from "bundle/counter/functions/GetNumber.sol";
import {Increment} from "bundle/counter/functions/Increment.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";

/**
 * @title CounterDeployer
 * @dev Library for deploying and initializing Counter contracts
 */
library CounterDeployer {
    string internal constant BUNDLE_NAME = "Counter";

    /**
     * @dev Deploys the Counter contract
     * @param mc MCDevKit storage reference
     * @return counter Address of the deployed Counter proxy contract
     */
    function deployCounter(MCDevKit storage mc, uint256 initialNumber) internal returns(address counter) {
        mc.init(BUNDLE_NAME);
        mc.use("Initialize", Initialize.initialize.selector, address(new Initialize()));
        mc.use("GetNumber", GetNumber.getNumber.selector, address(new GetNumber()));
        mc.use("Increment", Increment.increment.selector, address(new Increment()));
        mc.use("SetNumber", SetNumber.setNumber.selector, address(new SetNumber()));
        mc.useFacade(address(new CounterFacade()));
        return mc.deploy(abi.encodeCall(Initialize.initialize, initialNumber)).toProxyAddress();
    }
}
