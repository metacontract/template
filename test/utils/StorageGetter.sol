// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageSchema} from "../../src/counter/storages/StorageSchema.sol";
import {StorageRef} from "../../src/counter/storages/StorageRef.sol";

contract StorageGetter {
    function Counter() public pure returns(StorageSchema.$Counter memory) {
        return StorageRef.Counter();
    }
}
