// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCDevKit, Dictionary_1 as Dictionary} from "@mc-devkit/Flattened.sol";
// Interface
import {CounterFacade} from "bundle/counter/interfaces/CounterFacade.sol";
// Functions
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";

/**
 * @title CounterUpgrader
 * @dev Library for upgrading Counter contracts
 */
library CounterUpgrader {
    string internal constant BUNDLE_NAME = "Counter";

    /**
     * @dev Upgrades the setNumber function
     * @param mc MCDevKit storage reference
     * @param counter Address of the deployed Counter proxy contract
     */
    function upgradeSetNumber(MCDevKit storage mc, address counter) internal {
        Dictionary memory _dictionary = mc.loadDictionary("CounterDictionary", mc.getDictionaryAddress(counter));
        _dictionary.set(SetNumber.setNumber.selector, address(new SetNumber()));
        _dictionary.upgradeFacade(address(new CounterFacade()));
    }
}
