// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCStateFuzzingTest} from "@mc/devkit/MCTest.sol";
import {Increment} from "bundle/counter/functions/Increment.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";

contract IncrementStateFuzzingTest is MCStateFuzzingTest {
    Increment immutable counter = Increment(address(this));

    function setUp() public {
        implementations[Increment.increment.selector] = address(new Increment());
    }

    function testFuzz_Success_increment(uint256 fuzzNumber) public {
        vm.assume(fuzzNumber != type(uint256).max);
        Storage.CounterState().number = fuzzNumber;
        counter.increment();
        assertEq(Storage.CounterState().number, fuzzNumber + 1);
    }
}
