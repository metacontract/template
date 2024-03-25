// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCTest} from "mc/devkit/MCTest.sol";
import {stdError} from "forge-std/StdError.sol";
import {DeployLib} from "../../script/DeployLib.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";
import {StorageRef} from "bundle/counter/storages/StorageRef.sol";
import {StorageGetter} from "../utils/StorageGetter.sol";
import {MCDevKit} from "mc/devkit/MCDevKit.sol";

contract CounterBundleTest is MCTest {
    using DeployLib for MCDevKit;
    ICounter public counter;

    function setUp() public {
        counter = ICounter(mc.deployCounter(0).toProxyAddress());
        mc.setStorageGetter(StorageGetter.Counter.selector, address(new StorageGetter()));
    }

    function test_Success_increment() public {
        counter.increment();
        assertEq(counter.Counter().number, 1);
    }

    function testFuzz_Success_increment(uint256 fuzzNumber) public {
        vm.assume(fuzzNumber != type(uint256).max);
        counter.setNumber(fuzzNumber);
        counter.increment();
        assertEq(counter.Counter().number, fuzzNumber + 1);
    }

    function test_Fail_increment() public {
        counter.setNumber(type(uint256).max);
        vm.expectRevert(stdError.arithmeticError);
        counter.increment();

    }
}
