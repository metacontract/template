// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage} from "bundle/counter/storage/Storage.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";

/**
 * @title SetNumber
 * @notice This contract sets a new number in storage
 * @dev The number is stored in the CounterState
 */
contract SetNumber {
    /**
     * @notice Sets a new number in storage
     * @param newNumber The new number to be stored
     */
    function setNumber(uint256 newNumber) external {
        Storage.CounterState().number = newNumber;
        emit ICounter.NumberSet(newNumber);
    }
}

// Testing
import {MCTest} from "@mc-devkit/Flattened.sol";

/**
 * @title SetNumberTest
 * @notice Test contract for the SetNumber function contract
 */
contract SetNumberTest is MCTest {
    function setUp() public {
        _use(SetNumber.setNumber.selector, address(new SetNumber()));
    }

    /**
     * @notice Test successful setting of the number
     * @param fuzzNumber The number to set in storage for testing
     */
    function testFuzz_setNumber_success(uint256 fuzzNumber) public {
        // Assertion for event
        vm.expectEmit();
        emit ICounter.NumberSet(fuzzNumber);

        // Action: Set the number in storage
        SetNumber(target).setNumber(fuzzNumber);

        // Assertion: Check if the stored number matches the fuzz number
        assertEq(Storage.CounterState().number, fuzzNumber, "Stored number should match the set number");
    }
}
