// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Increment} from "bundle/counter/functions/Increment.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";
import {StorageRef} from "bundle/counter/storages/StorageRef.sol";
import "mc/devkit/MCTest.sol";

contract IncrementUnitTest is MCStateFuzzingTest {
    Increment increment;

    function setUp() public {
        increment = new Increment();
        setImplementation(increment.increment.selector, address(increment));
    }

    function test_Increment() public {
        uint befNumber = StorageRef.Counter().number;
        ICounter(address(this)).increment();
        uint aftNumber = StorageRef.Counter().number;
        assertEq(aftNumber - befNumber, 1);
    }
}
