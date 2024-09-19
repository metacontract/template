// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage} from "bundle/counter/storage/Storage.sol";

/**
 * @title GetNumber
 * @notice This contract retrieves the current number from the storage
 * @dev The number is stored in the CounterState
 */
contract GetNumber {
    /**
     * @notice Retrieves the current number
     * @return number The current number stored in the CounterState
     */
    function getNumber() external view returns(uint256 number) {
        return Storage.CounterState().number;
    }
}

// Testing
import {MCTest} from "@mc-devkit/Flattened.sol";

/**
 * @title GetNumberTest
 * @notice Test contract for the GetNumber function contract
 */
contract GetNumberTest is MCTest {
    function setUp() public {
        _use(GetNumber.getNumber.selector, address(new GetNumber()));
    }

    /**
     * @notice Test successful retrieval of the number
     * @param fuzzNumber The number to set in storage for testing
     */
    function testFuzz_getNumber_success(uint256 fuzzNumber) public {
        // Arrange: Set the number in storage
        Storage.CounterState().number = fuzzNumber;

        // Action: Retrieve the number
        uint256 _retrievedNumber = GetNumber(target).getNumber();

        // Assertion: Check if the retrieved number matches the fuzz number
        assertEq(_retrievedNumber, fuzzNumber, "Retrieved number should match the stored number");
    }
}
