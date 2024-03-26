// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCStateFuzzingTest} from "mc/devkit/MCTest.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";

contract SetNumberFunctionStateFuzzingTest is MCStateFuzzingTest {
    SetNumber immutable counter = SetNumber(address(this));

    function setUp() public {
        implementations[SetNumber.setNumber.selector] = address(new SetNumber());
    }

    function testFuzz_Success_setNumber(uint256 fuzzNumber) public {
        counter.setNumber(fuzzNumber);
        assertEq(Storage.Counter().number, fuzzNumber);
    }
}
