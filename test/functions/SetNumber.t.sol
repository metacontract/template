// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCTest} from "@mc/devkit/MCTest.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";

contract SetNumberTest is MCTest {
    function setUp() public {
        _use(SetNumber.setNumber.selector, address(new SetNumber()));
    }

    function testFuzz_Success_setNumber(uint256 fuzzNumber) public {
        SetNumber(target).setNumber(fuzzNumber);
        assertEq(Storage.CounterState().number, fuzzNumber);
    }
}