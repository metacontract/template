// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Initializable} from "@oz.mc/proxy/utils/Initializable.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";

/**
 * @title Initialize
 * @notice This contract handles the initialization process for Counter bundle
 * @dev Inherits from Initializable to ensure one-time initialization
 */
contract Initialize is Initializable {
    function initialize(uint256 initialNumber) external initializer {
        Storage.CounterState().number = initialNumber;
        emit ICounter.NumberSet(initialNumber);
    }
}

// Testing
import {MCTest, console} from "@mc-devkit/Flattened.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";

/**
 * @title InitializeTest
 * @notice Test contract for the Initialize function contract
 */
contract InitializeTest is MCTest {
    function setUp() public {
        _use(Initialize.initialize.selector, address(new Initialize()));
    }

    /**
     * @notice Test successful initialization of Counter with a specified number
     */
    function test_initialize_success() public {
        // Arrange
        uint256 _number = 100;

        // Assertion for event
        vm.expectEmit();
        emit ICounter.NumberSet(_number);

        // Action
        Initialize(target).initialize(_number);

        // Assertion
        assertEq(Storage.CounterState().number, _number, "Stored number should match input");
    }

    /**
     * @notice Test successful initialization of Counter with a specified number
     * @param fuzzNumber The fuzz number for testing
     */
    function testFuzz_initialize_success(uint256 fuzzNumber) public {
        // Assertion for event
        vm.expectEmit();
        emit ICounter.NumberSet(fuzzNumber);

        // Action
        Initialize(target).initialize(fuzzNumber);

        // Assertion
        assertEq(Storage.CounterState().number, fuzzNumber, "Stored number should match input");
    }
}
