// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageSchema, COUNTER_LOCATION} from "./StorageSchema.sol";

library StorageRef {
    function Counter() internal pure returns(StorageSchema.$Counter storage ref) {
        assembly { ref.slot := COUNTER_LOCATION }
    }
}
