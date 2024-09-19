// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage} from "bundle/counter/storage/Storage.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";

/**
 * @title Increment
 * @notice This contract increments the current number in storage
 * @dev The number is stored in the CounterState
 */
contract Increment {
    /**
     * @notice Increments the current number by one
     */
    function increment() external {
        Storage.CounterState().number++;
        emit ICounter.NumberSet(Storage.CounterState().number);
    }
}

// Testing
import {MCTest, stdError} from "@mc-devkit/Flattened.sol";

/**
 * @title IncrementTest
 * @notice Test contract for the Increment function contract
 */
contract IncrementTest is MCTest {
    function setUp() public {
        _use(Increment.increment.selector, address(new Increment()));
    }

    /**
     * @notice Test successful increment of the number
     * @param fuzzNumber The number to set in storage before incrementing
     */
    function testFuzz_increment_success(uint256 fuzzNumber) public {
        // Arrange: Set the number in storage
        vm.assume(fuzzNumber != type(uint256).max);
        Storage.CounterState().number = fuzzNumber;

        // Assertion for event
        vm.expectEmit();
        emit ICounter.NumberSet(fuzzNumber + 1);

        // Action: Increment the number
        Increment(target).increment();

        // Assertion: Check if the incremented number matches the expected value
        assertEq(Storage.CounterState().number, fuzzNumber + 1, "Incremented number should be one more than the stored number");
    }

    function test_increment_revert_overflow() public {
        // Arrange: Set the number in storage
        Storage.CounterState().number = type(uint256).max;

        // Action: Increment the number
        vm.expectRevert(stdError.arithmeticError);
        Increment(target).increment();
    }
}
