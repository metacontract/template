// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageRef} from "../storages/StorageRef.sol";

contract Increment {
    function increment() public {
        StorageRef.Counter().number++;
    }
}
