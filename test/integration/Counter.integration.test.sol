// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ICounter} from "bundle/counter/interfaces/ICounter.sol";
import "mc/devkit/MCDevKit.sol";
import "mc/devkit/MCTest.sol";
import "script/DeployLib.sol";


import "forge-std/console.sol";

contract CounterIntegrationTest is MCTest {
    using DeployLib for MCDevKit;
    ICounter public counter;

    function setUp() public {
        vm.prank(address(this));
        mc.deployCounter();

        counter = ICounter(mc.findProxy(DeployLib.bundleName()).addr);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.Counter().number, 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.Counter().number, x);
    }
}
