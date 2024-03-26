// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Storage} from "../storage/Storage.sol";

contract SetNumber {
    function setNumber(uint256 newNumber) external {
        Storage.CounterState().number = newNumber;
    }
}
