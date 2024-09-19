// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest, MCDevKit, stdError} from "@mc-devkit/Flattened.sol";
import {CounterDeployer} from "../script/deploy/CounterDeployer.sol";

import {Storage} from "bundle/counter/storage/Storage.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";

contract CounterScenarioTest is MCTest {
    using CounterDeployer for MCDevKit;
    ICounter public counter;

    function setUp() public {
        counter = ICounter(CounterDeployer.deployCounter(mc, 100));
    }

    function testFuzz_setAndIncrementNumber_success(uint256 _number) public {
        counter.setNumber(_number);
        assertEq(counter.getNumber(), _number);

        vm.assume(_number != type(uint256).max);
        counter.increment();
        assertEq(counter.getNumber(), _number + 1);
    }

    function test_increment_revert_overflow() public {
        counter.setNumber(type(uint256).max);
        vm.expectRevert(stdError.arithmeticError);
        counter.increment();

    }

}
