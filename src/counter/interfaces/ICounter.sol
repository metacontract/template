// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StorageSchema} from "../storages/StorageSchema.sol";

interface ICounter {
    function Counter() external pure returns(StorageSchema.$Counter memory ref);
    function increment() external;
    function initialize(uint256 initialNumber) external;
    function setNumber(uint256 newNumber) external;
}
