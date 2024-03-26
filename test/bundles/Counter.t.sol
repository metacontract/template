// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCDevKit} from "mc/devkit/MCDevKit.sol";
import {MCTest} from "mc/devkit/MCTest.sol";
import {stdError} from "forge-std/StdError.sol";

import {DeployLib} from "../../script/DeployLib.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";

import {Storage} from "bundle/counter/storage/Storage.sol";
import {Schema} from "bundle/counter/storage/Schema.sol";
import {StorageReader} from "../utils/StorageReader.sol";
import {ICounterTester} from "../utils/ICounterTester.sol";

contract CounterTest is MCTest {
    using DeployLib for MCDevKit;
    ICounterTester public counter;

    function setUp() public {
        counter = ICounterTester(mc.deployCounter(0).toProxyAddress());
        mc.setStorageGetter(StorageReader.CounterState.selector, address(new StorageReader()));
    }

    function test_Success_increment() public {
        counter.increment();
        assertEq(counter.CounterState().number, 1);
    }

    function testFuzz_Success_increment(uint256 fuzzNumber) public {
        vm.assume(fuzzNumber != type(uint256).max);
        counter.setNumber(fuzzNumber);
        counter.increment();
        assertEq(counter.CounterState().number, fuzzNumber + 1);
    }

    function test_Fail_increment() public {
        counter.setNumber(type(uint256).max);
        vm.expectRevert(stdError.arithmeticError);
        counter.increment();

    }
}
