// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";
import {StorageRef} from "bundle/counter/storages/StorageRef.sol";
import "mc/devkit/MCTest.sol";

contract SetNumberUnitTest is MCStateFuzzingTest {
    SetNumber public setNumber;

    function setUp() public override {
        setNumber = new SetNumber();
        setImplementation(setNumber.setNumber.selector, address(setNumber));
    }

    function test_SetNumber(uint256 x) public {
        ICounter(address(this)).setNumber(x);
        assertEq(StorageRef.Counter().number, x);
    }
}
