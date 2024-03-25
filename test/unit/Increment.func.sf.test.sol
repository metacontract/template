// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCStateFuzzingTest} from "mc/devkit/MCTest.sol";
import {Increment} from "bundle/counter/functions/Increment.sol";
import {StorageRef} from "bundle/counter/storages/StorageRef.sol";

contract IncrementFunctionStateFuzzingTest is MCStateFuzzingTest {
    Increment immutable counter = Increment(address(this));

    function setUp() public {
        implementations[Increment.increment.selector] = address(new Increment());
    }

    function testFuzz_Success_increment(uint256 fuzzNumber) public {
        vm.assume(fuzzNumber != type(uint256).max);
        StorageRef.Counter().number = fuzzNumber;
        counter.increment();
        assertEq(StorageRef.Counter().number, fuzzNumber + 1);
    }
}
