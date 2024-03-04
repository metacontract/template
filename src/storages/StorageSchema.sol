// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library StorageSchema {
    /// @custom:storage-location erc7201:example.counter
    struct Counter {
        uint256 number;
    }

    bytes32 constant COUNTER_STORAGE_LOCATION = 0x0;
    function $Counter() internal pure returns(Counter storage $) {
        assembly {
            $.slot := COUNTER_STORAGE_LOCATION
        }
    }
}
