// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * Schema v0.1.0
 */
library Schema {
    bytes32 internal constant TEMPLATE_COUNTER_COUNTERSTATE = 0x9d2213992402928855512c8ba65338877a8da4519b1df3203c2a2647166a8d00;
    /// @custom:storage-location erc7201:Template.Counter.CounterState
    struct $CounterState {
        uint256 number;
    }
}
