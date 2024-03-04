// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageSchema} from "../storages/StorageSchema.sol";

contract SetNumber {
    function setNumber(uint256 newNumber) public {
        StorageSchema.$Counter().number = newNumber;
    }
}
