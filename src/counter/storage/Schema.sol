// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title Counter Schema v0.1.0
 */
library Schema {
    /// @custom:storage-location erc7201:Counter.CounterState
    struct CounterState {
        uint256 number;
    }
}
