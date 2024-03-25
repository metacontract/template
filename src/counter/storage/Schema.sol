// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

bytes32 constant COUNTER_LOCATION = 0x49d5a80cae1d87c6b488849db9f609a47e863c817ad78c3fca3ff0a745233c00;

/**
 * Schema v0.1.0
 */
interface Schema {
    /// @custom:storage-location erc7201:template.counter.Counter
    struct $Counter {
        uint256 number;
    }
}
