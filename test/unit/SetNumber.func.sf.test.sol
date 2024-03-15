// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCStateFuzzingTest} from "mc/devkit/MCTest.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {StorageRef} from "bundle/counter/storages/StorageRef.sol";

contract SetNumberFunctionStateFuzzingTest is MCStateFuzzingTest {
    function setUp() public {
        implementations[SetNumber.setNumber.selector] = address(new SetNumber());
    }

    function test_Success_setNumber(uint256 fuzzNumber) public {
        StorageRef.Counter().number = fuzzNumber;

        SetNumber(address(this)).setNumber(fuzzNumber);

        assertEq(StorageRef.Counter().number, fuzzNumber);
    }
}
