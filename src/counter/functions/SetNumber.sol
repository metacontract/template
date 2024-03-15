// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageRef} from "../storages/StorageRef.sol";

contract SetNumber {
    function setNumber(uint256 newNumber) public {
        StorageRef.Counter().number = newNumber;
    }
}
