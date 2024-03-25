// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Schema, COUNTER_LOCATION} from "./Schema.sol";

library Storage {
    function Counter() internal pure returns(Schema.$Counter storage ref) {
        assembly { ref.slot := COUNTER_LOCATION }
    }
}
