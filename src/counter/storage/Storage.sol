// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Schema} from "./Schema.sol";

library Storage {
    function CounterState() internal pure returns(Schema.$CounterState storage ref) {
        bytes32 slot = Schema.TEMPLATE_COUNTER_COUNTERSTATE;
        assembly { ref.slot := slot }
    }
}
