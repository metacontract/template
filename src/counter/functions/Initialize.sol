// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageRef} from "../storages/StorageRef.sol";

contract Initialize {
    function initialize(uint256 initialNumber) public {
        StorageRef.Counter().number = initialNumber;
    }
}
