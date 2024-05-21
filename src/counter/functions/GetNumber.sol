// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Storage} from "../storage/Storage.sol";

contract GetNumber {
    function getNumber() external view returns(uint256) {
        return Storage.CounterState().number;
    }
}
