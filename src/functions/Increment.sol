// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageSchema} from "../storages/StorageSchema.sol";

contract Increment {
    function increment() public {
        StorageSchema.$Counter().number++;
    }
}
