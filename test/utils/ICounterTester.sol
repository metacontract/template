// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Schema} from "bundle/counter/storage/Schema.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";

interface ICounterTester is ICounter {
    function CounterState() external pure returns(Schema.$CounterState memory);
}
