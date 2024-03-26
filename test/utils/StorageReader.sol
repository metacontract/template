// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Schema} from "../../src/counter/storage/Schema.sol";
import {Storage} from "../../src/counter/storage/Storage.sol";

contract StorageReader {
    function CounterState() public pure returns(Schema.$CounterState memory) {
        return Storage.CounterState();
    }
}
