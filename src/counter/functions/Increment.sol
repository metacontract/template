// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Storage} from "../storage/Storage.sol";

contract Increment {
    function increment() public {
        Storage.Counter().number++;
    }
}
